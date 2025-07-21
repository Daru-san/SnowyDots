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
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];
    bind =
      [
        "SUPER,minus,splitratio,-0.25"
        "SUPERSHIFT,minus,splitratio,-0.3333333"

        "SUPER,equal,splitratio,0.25"
        "SUPERSHIFT,equal,splitratio,0.3333333"

        "SUPER,apostrophe,changegroupactive,f"
        "SUPERSHIFT,apostrophe,changegroupactive,b"

        "SUPER,u,togglespecialworkspace,stash"
        "supershift,u,movetoworkspace,special: stash"

        "super,g, hy3:makegroup, tab, toggle"

        "supershift, g, hy3:changegroup, toggletab"

        "superalt,tab,cyclenext"

        "super, tab, hy3:focustab, r"
        "supershift, tab, hy3:focustab, l"

        "super, page_up, workspace,e-1"
        "super, page_down, workspace,e+1"

        # "SUPER, grave, overview:toggle, toggle"
      ]
      ++
        # Change workspace
        (map (n: "SUPER,${n},workspace,${n}") workspaces)
      ++
        # Move window to workspace
        (map (n: "SUPERSHIFT,${n},hy3:movetoworkspace,${n}, follow") workspaces)
      ++
        # Move focus
        (mapAttrsToList (key: direction: "SUPER,${key},hy3:movefocus,${direction}, warp") directions)
      ++
        # Swap windows
        (mapAttrsToList (
          key: direction: "SUPERSHIFT,${key},hy3:movewindow,${direction}, once, visible"
        ) directions)
      ++ (mapAttrsToList (key: direction: "ALTSHIFT, ${key}, hy3:focustab, ${direction}") directions)
      ++
        # Move windows
        (mapAttrsToList (key: direction: "SUPERCONTROL,${key},movewindoworgroup,${direction}") directions)
      ++
        # Move monitor focus
        (mapAttrsToList (key: direction: "SUPERALT,${key},focusmonitor,${direction}") directions)
      ++
        # Move workspace to other monitor
        (mapAttrsToList (
          key: direction: "SUPERALTSHIFT,${key},movecurrentworkspacetomonitor,${direction}"
        ) directions);
  };
}
