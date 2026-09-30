{ lib, ... }:
let
  inherit (lib) range mapAttrsToList;
  workspaces = map toString (range 0 9);
  directions = rec {
    left = "left";
    right = "right";
    up = "up";
    down = "down";
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
      # "SUPER,apostrophe,changegroupactive,f"
      # "SUPER+SHIFT,apostrophe,changegroupactive,b"

      "SUPER,g, groupinit"

      # "SUPER+SHIFT, g, changegroup, toggletab"

      "SUPER, tab, focusstack, next"
      "SUPER+SHIFT, tab, focusstack, prev"

      "SUPER, page_up, viewtoleft,"
      "SUPER, page_down, viewtoright,"
      "SUPER+SHIFT, page_up, tagtoleft"
      "SUPER+SHIFT, page_down, tagtoright"

      "SUPER, w, toggleoverview"
    ]
    ++
      # Change workspace
      (map (n: "SUPER,${n},view,${n}") workspaces)
    ++
      # Move window to workspace
      (map (n: "SUPER+SHIFT,${n},tag,${n}, follow") workspaces)
    ++
      # Move focus
      (mapAttrsToList (key: direction: "SUPER,${key},focusdir,${direction}") directions)
    ++ (mapAttrsToList (key: direction: "ALT+SHIFT, ${key}, exchange_client, ${direction}") directions)
    ++
      # Move windows
      (mapAttrsToList (key: direction: "SUPER+CTRL,${key},move_client,${direction}") directions)
    ++
      # Move monitor focus
      (mapAttrsToList (key: direction: "SUPER+ALT,${key},focusmon,${direction}") directions)
    ++
      # Move workspace to other monitor
      (mapAttrsToList (key: direction: "SUPER+ALT+SHIFT,${key},tagmon,${direction}") directions);
  };
}
