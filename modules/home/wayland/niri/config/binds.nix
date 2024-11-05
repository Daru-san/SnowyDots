{
  lib,
  config,
  inputs,
  system,
  pkgs,
  ...
}:
{
  programs.niri.settings = {
    binds =
      let
        inherit (lib) getExe getExe' mkMerge;
      in
      with config.lib.niri.actions;
      mkMerge [
        {
          "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];

          "Mod+Left".action.focus-column-left = [ ];
          "Mod+Down".action.focus-window-down = [ ];
          "Mod+Up".action.focus-window-up = [ ];
          "Mod+Right".action.focus-column-right = [ ];
          "Mod+H".action.focus-column-left = [ ];
          "Mod+J".action.focus-window-down = [ ];
          "Mod+K".action.focus-window-up = [ ];
          "Mod+L".action.focus-column-right = [ ];

          "Mod+Ctrl+Left".action.move-column-left = [ ];
          "Mod+Ctrl+Down".action.move-window-down = [ ];
          "Mod+Ctrl+Up".action.move-window-up = [ ];
          "Mod+Ctrl+Right".action.move-column-right = [ ];
          "Mod+Ctrl+H".action.move-column-left = [ ];
          "Mod+Ctrl+J".action.move-window-down = [ ];
          "Mod+Ctrl+K".action.move-window-up = [ ];
          "Mod+Ctrl+L".action.move-column-right = [ ];

          "Mod+Home".action.focus-column-first = [ ];
          "Mod+End".action.focus-column-last = [ ];
          "Mod+Ctrl+Home".action.move-column-to-first = [ ];
          "Mod+Ctrl+End".action.move-column-to-last = [ ];

          "Mod+Shift+Left".action.focus-monitor-left = [ ];
          "Mod+Shift+Down".action.focus-monitor-down = [ ];
          "Mod+Shift+Up".action.focus-monitor-up = [ ];
          "Mod+Shift+Right".action.focus-monitor-right = [ ];
          "Mod+Shift+H".action.focus-monitor-left = [ ];
          "Mod+Shift+J".action.focus-monitor-down = [ ];
          "Mod+Shift+K".action.focus-monitor-up = [ ];
          "Mod+Shift+L".action.focus-monitor-right = [ ];

          "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [ ];
          "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [ ];
          "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [ ];
          "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [ ];
          "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = [ ];
          "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = [ ];
          "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = [ ];
          "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = [ ];

          "Mod+Page_Down".action.focus-workspace-down = [ ];
          "Mod+Page_Up".action.focus-workspace-up = [ ];
          "Mod+U".action.focus-workspace-down = [ ];
          "Mod+I".action.focus-workspace-up = [ ];
          "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [ ];
          "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [ ];
          "Mod+Ctrl+U".action.move-column-to-workspace-down = [ ];
          "Mod+Ctrl+I".action.move-column-to-workspace-up = [ ];

          "Mod+Shift+Page_Down".action.move-workspace-down = [ ];
          "Mod+Shift+Page_Up".action.move-workspace-up = [ ];
          "Mod+Shift+U".action.move-workspace-down = [ ];
          "Mod+Shift+I".action.move-workspace-up = [ ];

          "Mod+1".action.focus-workspace = 1;
          "Mod+2".action.focus-workspace = 2;
          "Mod+3".action.focus-workspace = 3;
          "Mod+4".action.focus-workspace = 4;
          "Mod+5".action.focus-workspace = 5;
          "Mod+6".action.focus-workspace = 6;
          "Mod+7".action.focus-workspace = 7;
          "Mod+8".action.focus-workspace = 8;
          "Mod+9".action.focus-workspace = 9;
          "Mod+Ctrl+1".action.move-column-to-workspace = 1;
          "Mod+Ctrl+2".action.move-column-to-workspace = 2;
          "Mod+Ctrl+3".action.move-column-to-workspace = 3;
          "Mod+Ctrl+4".action.move-column-to-workspace = 4;
          "Mod+Ctrl+5".action.move-column-to-workspace = 5;
          "Mod+Ctrl+6".action.move-column-to-workspace = 6;
          "Mod+Ctrl+7".action.move-column-to-workspace = 7;
          "Mod+Ctrl+8".action.move-column-to-workspace = 8;
          "Mod+Ctrl+9".action.move-column-to-workspace = 9;

          # Alternatively, there are commands to move just a single window:
          # "Mod+Ctrl+1" leaf move-window-to-workspace" 1

          "Mod+Comma".action.consume-window-into-column = [ ];
          "Mod+Period".action.expel-window-from-column = [ ];

          "Mod+R".action.switch-preset-column-width = [ ];
          "Mod+Shift+F".action.maximize-column = [ ];
          "Mod+C".action.center-column = [ ];

          "Mod+Minus".action.set-column-width = "-10%";
          "Mod+Equal".action.set-column-width = "+10%";

          "Mod+Shift+Minus".action.set-window-height = "-10%";
          "Mod+Shift+Equal".action.set-window-height = "+10%";
        }
        (
          let
            terminal = getExe config.programs.kitty.package;
            file-manager = getExe pkgs.nautilus;
            editor = "nvim";
            yazi = getExe config.programs.yazi.package;
            hyprlock = getExe config.programs.hyprlock.package;
            btop = getExe config.programs.btop.package;
            copyq = getExe pkgs.copyq;
            valent = getExe pkgs.valent;
            easyeffects = getExe config.services.easyeffects.package;
            syncthingtray = getExe (
              pkgs.syncthingtray.overrideAttrs {
                meta.mainProgram = "syncthingtray";
              }
            );
          in
          {
            "Mod+Shift+q".action.close-window = [ ];
            "Mod+q".action.spawn = [ terminal ];
            "Mod+e".action.spawn = [ file-manager ];
            "Mod+Shift+v".action.spawn = [
              copyq
              "menu"
            ];
            "Mod+n".action.spawn = [ valent ];
            "Mod+a".action.spawn = [ easyeffects ];
            "Mod+alt+l".action.spawn = [
              hyprlock
              "--immediate"
            ];
            # "Mod+Shift+m".action.spawn = [
            #   syncthingtray
            #   "-w"
            # ];
            # "Mod+m".action.spawn = [
            #   terminal
            #   "--detach"
            #   btop
            # ];
            "Mod+z".action.spawn = [
              terminal
              "--detach"
              editor
            ];
            # "Mod+r".action.spawn = [
            #   terminal
            #   "--detach"
            #   yazi
            # ];
            "Mod+Shift+E".action.quit = [ ];
            "Mod+Ctrl+Shift+E".action.quit = {
              skip-confirmation = true;
            };
            "Print".action.screenshot = [ ];
            "Shift+Print".action.screenshot-screen = [ ];
            "Mod+F".action.fullscreen-window = [ ];
          }
        )
        (
          let
            s = getExe' config.services.swayosd.package "swayosd-client";
            mute = "--output-volume mute-toggle";
            raise-volume = "--output-volume raise";
            lower-volume = "--output-volume lower";
            raise-brightness = "--brightness raise";
            lower-brightness = "--brightness lower";
          in
          {
            "XF86MonBrightnessUp".action.spawn = [
              s
              raise-brightness
            ];
            "XF86MonBrightnessDown".action.spawn = [
              s
              lower-brightness
            ];

            "XF86AudioRaiseVolume".action.spawn = [
              s
              raise-volume
            ];
            "XF86AudioLowerVolume".action.spawn = [
              s
              lower-volume
            ];
            "XF86AudioMute".action.spawn = [
              s
              mute
            ];
          }
        )
        (
          let
            p = getExe config.services.playerctld.package;
            next = "next";
            prev = "previous";
            toggle-play = "play-pause";
            stop = "stop";
          in
          {
            "XF86AudioPlay".action.spawn = [
              p
              toggle-play
            ];
            "XF86AudioStop".action.spawn = [
              p
              stop
            ];
            "XF86AudioPrev".action.spawn = [
              p
              prev
            ];
            "XF86AudioNext".action.spawn = [
              p
              next
            ];
          }
        )
        (
          let
            sh = spawn "sh" "-c";
            anyrun = getExe config.programs.anyrun.package;
            color-picker = getExe inputs.color-picker.packages.${system}.default;
            wlogout = getExe config.programs.wlogout.package;
            iwgtk = getExe pkgs.iwgtk;
            kitty = getExe pkgs.kitty;
            overskride = getExe pkgs.overskride;
          in
          {

            "Mod+d".action = sh "pkill anyrun || ${anyrun}";

            # "Mod+i".action = sh "pkill iwgtk || ${iwgtk}";

            "Mod+Shift+c".action = sh "pkill color-picker || ${color-picker}";

            "Mod+x".action = sh "pkill wlogout || ${wlogout}";

            "Mod+p".action = sh "pkill pulsemixer || ${kitty} --class pulsemixer --detach pulsemixer";

            # "Mod+Shift+i".action = sh "pkill overskride || ${overskride}";
          }
        )
      ];
  };
}
