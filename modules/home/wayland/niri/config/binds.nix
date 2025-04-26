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
        inherit (config.lib.niri.actions) spawn;
        sh = spawn "sh" "-c";
      in
      mkMerge [
        {
          "Mod+F12" = {
            action.spawn = [
              "systemctl"
              "suspend"
            ];
            allow-when-locked = true;
            repeat = false;
          };
          "Mod+Shift+E".action.quit = [ ];
          "Mod+Ctrl+Shift+E".action.quit = {
            skip-confirmation = true;
          };
          "Print".action.screenshot = [ ];
          "Shift+Print".action.screenshot-screen = [ ];
          "Mod+F".action.fullscreen-window = [ ];
          "Mod+Shift+q".action.close-window = [ ];
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
        {
          "Mod+1".action.focus-workspace = "sys";
          "Mod+2".action.focus-workspace = "web";
          "Mod+3".action.focus-workspace = "dev";
          "Mod+4".action.focus-workspace = "files";
          "Mod+5".action.focus-workspace = "media";
          "Mod+6".action.focus-workspace = "content";
          "Mod+7".action.focus-workspace = "chat";
          "Mod+8".action.focus-workspace = "vm";
          "Mod+9".action.focus-workspace = "docs";
          "Mod+0".action.focus-workspace = "misc";

          "Mod+Ctrl+1".action.move-column-to-workspace = "sys";
          "Mod+Ctrl+2".action.move-column-to-workspace = "web";
          "Mod+Ctrl+3".action.move-column-to-workspace = "dev";
          "Mod+Ctrl+4".action.move-column-to-workspace = "files";
          "Mod+Ctrl+5".action.move-column-to-workspace = "media";
          "Mod+Ctrl+6".action.move-column-to-workspace = "content";
          "Mod+Ctrl+7".action.move-column-to-workspace = "chat";
          "Mod+Ctrl+8".action.move-column-to-workspace = "vm";
          "Mod+Ctrl+9".action.move-column-to-workspace = "docs";
          "Mod+Ctrl+0".action.move-column-to-workspace = "misc";

          "Mod+Shift+1".action.move-window-to-workspace = "sys";
          "Mod+Shift+2".action.move-window-to-workspace = "web";
          "Mod+Shift+3".action.move-window-to-workspace = "dev";
          "Mod+Shift+4".action.move-window-to-workspace = "files";
          "Mod+Shift+5".action.move-window-to-workspace = "media";
          "Mod+Shift+6".action.move-window-to-workspace = "content";
          "Mod+Shift+7".action.move-window-to-workspace = "chat";
          "Mod+Shift+8".action.move-window-to-workspace = "vm";
          "Mod+Shift+9".action.move-window-to-workspace = "docs";
          "Mod+Shift+0".action.move-window-to-workspace = "misc";
        }
        (
          let
            terminal = getExe config.programs.ghostty.package;
            file-manager = getExe pkgs.nautilus;
            editor = "${getExe pkgs.neovide} --neovim-bin ${getExe config.env.editor.package}";
            yazi = getExe config.programs.yazi.package;
            hyprlock = getExe config.programs.hyprlock.package;
            btop = getExe config.programs.btop.package;
            clipse = getExe pkgs.clipse-gui;
            easyeffects = getExe config.services.easyeffects.package;
          in
          {
            "Mod+q".action.spawn = [ terminal ];

            "Mod+e".action.spawn = [ file-manager ];

            "Mod+Shift+v".action.spawn = [
              clipse
            ];

            "Mod+a".action.spawn = [ easyeffects ];

            "Mod+alt+l".action.spawn = [
              hyprlock
              "--immediate"
            ];

            "Mod+Shift+period".action.spawn = [
              terminal
              "-e"
              btop
            ];

            "Mod+z".action.spawn = [
              editor
            ];
            "Mod+t".action.spawn = [
              terminal
              "-e"
              yazi
            ];
          }
        )
        (
          let
            obs = getExe pkgs.obs-cmd;
            record = cmd: "${obs} recording ${cmd}";
            audio = device: cmd: ''${obs} audio ${cmd} "${device}"'';
          in
          {
            "alt+f6".action.spawn = [
              (record "start")
            ];
            "alt+f8".action.spawn = [
              (record "stop")
            ];
            "alt+f7".action.spawn = [
              (record "toggle-pause")
            ];
            "alt+f1".action.spawn = [
              (audio "Desktop Audio" "toggle")
            ];
            "alt+f4".action.spawn = [
              (audio "Desktop Audio" "mute")
            ];
            "alt+f2".action.spawn = [
              (audio "MiMic" "mute")
            ];
            "alt+f3".action.spawn = [
              (audio "MiMic" "toggle")
            ];
          }
        )
        (
          let
            swayosd = getExe' config.services.swayosd.package "swayosd-client";
          in
          {
            "XF86MonBrightnessUp" = {
              allow-when-locked = true;
              action.spawn = [
                swayosd
                "--brightness"
                "raise"
              ];
            };

            "XF86MonBrightnessDown" = {
              allow-when-locked = true;
              action.spawn = [
                swayosd
                "--brightness"
                "lower"
              ];
            };

            "XF86AudioRaiseVolume" = {
              allow-when-locked = true;
              action.spawn = [
                swayosd
                "--output-volume"
                "raise"
              ];
            };

            "XF86AudioLowerVolume" = {
              allow-when-locked = true;
              action.spawn = [
                swayosd
                "--output-volume"
                "lower"
              ];
            };

            "XF86AudioMute" = {
              allow-when-locked = true;
              action.spawn = [
                swayosd
                "--output-volume"
                "mute-toggle"
              ];
            };
          }
        )
        (
          let
            playerctl = getExe config.services.playerctld.package;
            next = "next";
            prev = "previous";
            toggle-play = "play-pause";
            stop = "stop";
          in
          {
            "XF86AudioPlay" = {
              allow-when-locked = true;
              action.spawn = [
                playerctl
                toggle-play
              ];
            };

            "XF86AudioStop" = {
              allow-when-locked = true;
              action.spawn = [
                playerctl
                stop
              ];
            };

            "XF86AudioPrev" = {
              allow-when-locked = true;
              action.spawn = [
                playerctl
                prev
              ];
            };

            "XF86AudioNext" = {
              allow-when-locked = true;
              action.spawn = [
                playerctl
                next
              ];
            };
          }
        )
        (
          let
            anyrun = getExe config.programs.anyrun.package;
            color-picker = getExe inputs.color-picker.packages.${system}.default;
            iwgtk = getExe pkgs.iwgtk;
            ghostty = getExe pkgs.ghostty;
            nwgbar = getExe pkgs.nwg-bar;
            blueman = getExe' pkgs.blueman "blueman-manager";
          in
          {
            "Mod+d".action = sh "pkill anyrun || ${anyrun}";

            "Mod+b".action = sh "pkill iwgtk || ${iwgtk}";

            "Mod+Shift+c".action = sh "pkill color-picker || ${color-picker}";

            "Mod+x".action = sh "pkill nwg-bar || ${nwgbar}";

            "Mod+p".action = sh "pkill pulsemixer || ${ghostty} -e pulsemixer";
            "Mod+Shift+b".action = sh "pkill blueman-manager || ${blueman}";

          }
        )
      ];
  };
}
