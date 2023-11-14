{ lib, config, pkgs, inputs, ... }:
let
  workspaces =
    (map toString (lib.range 0 9)) ++
    (map (n: "F${toString n}") (lib.range 1 12));
  # Map keys to hyprland directions
#Not originally mine, I'll add credits when I find the repo
  directions = rec {
    left = "l"; right = "r"; up = "u"; down = "d";
    h = left; l = right; k = up; j = down;
  };
in {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      #Mouse bindings
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];

    bind = let
      swaylock = "${config.programs.swaylock.package}/bin/swaylock";
      rofi = "${config.programs.rofi.package}/bin/rofi";
      kitty = "${config.programs.kitty.package}/bin/kitty";
      hdrop = "${inputs.hyprland-contrib.packages.${pkgs.system}.hdrop}/bin/hdrop";
      copyq = "${config.services.copyq.package}/bin/copyq";
    in [
      "alt,q,killactive"
      "SUPERSHIFT,e,exit"
      "SUPER ,x,exec, rofi-power-menu"
      "SUPER, l ,exec , ${swaylock} -Ff"
      "SUPERSHIFT, v, exec, ${copyq} menu"

      "SUPER,s,togglesplit"
      "SUPER,f,fullscreen"
      # "SUPERSHIFT,f,fullscreen,0"
      "SUPER,v,togglefloating"
      "SUPER, p, exec, rofi -show top"
      "SUPER,tab, exec, ${rofi} -show window"

      "SUPER,minus,splitratio,-0.25"
      "SUPERSHIFT,minus,splitratio,-0.3333333"

      "SUPER,equal,splitratio,0.25"
      "SUPERSHIFT,equal,splitratio,0.3333333"

      "SUPER,g,togglegroup"
      "SUPER,t,lockactivegroup,toggle"
      "SUPER,apostrophe,changegroupactive,f"
      "SUPERSHIFT,apostrophe,changegroupactive,b"

      "SUPER,u,togglespecialworkspace"
      "SUPERSHIFT,u,movetoworkspace,special"

      "SUPERALT,P,togglespecialworkspace,usage"
      # "SUPERCTRL,P,movetoworkspace,usage"
      
      "SUPERALT,caps_lock,togglespecialworkspace,mink"
      "SUPER,a,togglespecialworkspace,audio"

      "SUPERSHIFT,b,togglespecialworkspace,PrivFox"

      "SUPERSHIFT,P,exec,${hdrop} '${kitty} -T SystemMonitor --session SystemMonitor.conf'" ##Launch task-manager like ui for process control

      #Super+tab to move to next workspace and back
      "ALT,TAB,workspace,m+1"
      "ALTSHIFT,TAB,workspace,m-1"
    ] ++
    # Change workspace
    (map (n:
      "SUPER,${n},workspace,name:${n}"
    ) workspaces) ++
    # Move window to workspace
    (map (n:
      "SUPERSHIFT,${n},movetoworkspacesilent,name:${n}"
    ) workspaces) ++
    # Move focus
    (lib.mapAttrsToList (key: direction:
      "SUPER,${key},movefocus,${direction}"
    ) directions) ++
    # Swap windows
    (lib.mapAttrsToList (key: direction:
      "SUPERSHIFT,${key},swapwindow,${direction}"
    ) directions) ++
    # Move windows
    (lib.mapAttrsToList (key: direction:
      "SUPERCONTROL,${key},movewindoworgroup,${direction}"
    ) directions) ++
    # Move monitor focus
    (lib.mapAttrsToList (key: direction:
      "SUPERALT,${key},focusmonitor,${direction}"
    ) directions) ++
    # Move workspace to other monitor
    (lib.mapAttrsToList (key: direction:
      "SUPERALTSHIFT,${key},movecurrentworkspacetomonitor,${direction}"
    ) directions);
  };
}
