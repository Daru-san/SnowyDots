{ lib, ... }:
let
  inherit (lib) range mapAttrsToList;
  workspaces = map toString (range 0 9);
  directions = rec {
    left = "l";
    right = "r";
    up = "u";
    down = "d";
    h = left;
    l = right;
    k = up;
    j = down;
  };
in
{
  wayland.windowManager.mango.settings = {
    mousebind = [
      "SUPER, btn_left, moveresize, curmove"
      "SUPER, btn_right, moveresize, curresize"
    ];
    bind = [
      "SUPER,apostrophe,changegroupactive,f"
      "SUPERSHIFT,apostrophe,changegroupactive,b"

      "super,g, hy3:makegroup, tab, toggle"

      "supershift, g, hy3:changegroup, toggletab"

      "super, tab, focusstack, next"
      "supershift, tab, focusstack, prev"

      "super, page_up, viewtoleft,"
      "super, page_down, viewtoright,"
      "supershift, page_up, tagtoleft"
      "supershift, page_down, tagtoright"

      "SUPER, w, toggleoverview"
    ]
    ++
      # Change workspace
      (map (n: "SUPER,${n},view,${n}") workspaces)
    ++
      # Move window to workspace
      (map (n: "SUPERSHIFT,${n},tag,${n}, follow") workspaces)
    ++
      # Move focus
      (mapAttrsToList (key: direction: "SUPER,${key},hy3:focusdir,${direction}") directions)
    ++ (mapAttrsToList (key: direction: "ALTSHIFT, ${key}, exchange_client, ${direction}") directions)
    ++
      # Move windows
      (mapAttrsToList (key: direction: "SUPERCONTROL,${key},move_client,${direction}") directions)
    ++
      # Move monitor focus
      (mapAttrsToList (key: direction: "SUPERALT,${key},focusmon,${direction}") directions)
    ++
      # Move workspace to other monitor
      (mapAttrsToList (key: direction: "SUPERALTSHIFT,${key},tagmon,${direction}") directions);
  };
}
