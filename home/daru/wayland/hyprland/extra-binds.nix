{
  lib,
  pkgs,
  ...
}: let
  workspaces =
    (map toString (lib.range 0 9))
    ++ (map (n: "F${toString n}") (lib.range 1 12));
  # Map keys to hyprland directions
  #Not originally mine, I'll add credits when I find the repo
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
      #Mouse bindings
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];
    bind =
      [
        #Changing split ratio
        "SUPER,minus,splitratio,-0.25"
        "SUPERSHIFT,minus,splitratio,-0.3333333"

        "SUPER,equal,splitratio,0.25"
        "SUPERSHIFT,equal,splitratio,0.3333333"

        "SUPER,g,togglegroup"
        "SUPER,t,lockactivegroup,toggle"
        "SUPER,apostrophe,changegroupactive,f"
        "SUPERSHIFT,apostrophe,changegroupactive,b"

        "SUPER,u,togglespecialworkspace,stash"
        "SUPERSHIFT,u,exec,pypr toggle_special stash"

        #Super+tab to move to next workspace and back
        "SUPER,TAB,workspace, m+1"
        "SUPERSHIFT,TAB,workspace, m-1"

        # Hycov binds
        "ALT,tab,hycov:toggleoverview"
        "bind=ALT,left,hycov:movefocus,l"
        "bind=ALT,right,hycov:movefocus,r"
        "bind=ALT,up,hycov:movefocus,u"
        "bind=ALT,down,hycov:movefocus,d"
      ]
      ++
      # Change workspace
      (map (n: "SUPER,${n},workspace,name:${n}") workspaces)
      ++
      # Move window to workspace
      (map (n: "SUPERSHIFT,${n},movetoworkspacesilent,name:${n}") workspaces)
      ++
      # Move focus
      (lib.mapAttrsToList
        (key: direction: "SUPER,${key},movefocus,${direction}")
        directions)
      ++
      # Swap windows
      (lib.mapAttrsToList
        (key: direction: "SUPERSHIFT,${key},swapwindow,${direction}")
        directions)
      ++
      # Move windows
      (lib.mapAttrsToList
        (key: direction: "SUPERCONTROL,${key},movewindoworgroup,${direction}")
        directions)
      ++
      # Move monitor focus
      (lib.mapAttrsToList
        (key: direction: "SUPERALT,${key},focusmonitor,${direction}")
        directions)
      ++
      # Move workspace to other monitor
      (lib.mapAttrsToList (key: direction: "SUPERALTSHIFT,${key},movecurrentworkspacetomonitor,${direction}")
        directions);
  };
}
