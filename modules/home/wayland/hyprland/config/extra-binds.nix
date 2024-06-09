{lib, ...}: let
  inherit (lib) range mapAttrsToList;
  workspaces =
    (map toString (range 0 9))
    ++ (map (n: "F${toString n}") (range 1 12));
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
in {
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

        "SUPER,g,togglegroup"
        "SUPER,t,lockactivegroup,toggle"
        "SUPER,apostrophe,changegroupactive,f"
        "SUPERSHIFT,apostrophe,changegroupactive,b"

        "SUPER,u,togglespecialworkspace,stash"

        "SUPER,TAB,workspace, m+1"
        "SUPERSHIFT,TAB,workspace, m-1"

        "supershift,o,cyclenext"
        "super,o,changegroupactive"

        # "ALT,tab,hycov:toggleoverview"
        # "ALTSHIFT,tab,hycov:toggleoverview,forceall"
      ]
      ++
      # Change workspace
      (map (n: "SUPER,${n},workspace,name:${n}") workspaces)
      ++
      # Move window to workspace
      (map (n: "SUPERSHIFT,${n},movetoworkspacesilent,name:${n}") workspaces)
      ++
      # Move focus
      (mapAttrsToList
        (key: direction: "SUPER,${key},movefocus,${direction}")
        directions)
      ++
      # Swap windows
      (mapAttrsToList
        (key: direction: "SUPERSHIFT,${key},swapwindow,${direction}")
        directions)
      ++
      # Move windows
      (mapAttrsToList
        (key: direction: "SUPERCONTROL,${key},movewindoworgroup,${direction}")
        directions)
      ++
      # Move monitor focus
      (mapAttrsToList
        (key: direction: "SUPERALT,${key},focusmonitor,${direction}")
        directions)
      ++
      # Move workspace to other monitor
      (mapAttrsToList (key: direction: "SUPERALTSHIFT,${key},movecurrentworkspacetomonitor,${direction}")
        directions);
  };
}
