{ lib, config, ... }:
{
  programs.niri.settings = {
    binds =
      with config.lib.niri.actions;
      lib.mkMerge [
        (
          let
            terminal = getExe config.programs.kitty.package;
            file-manager = getExe pkgs.nautilus;
            editor = "nvim";
            yazi = getExe config.programs.yazi.package;
            hyprlock = getExe config.programs.hyprlock.package;
            btop = getExe config.programs.btop.package;
            copyq = getExe pkgs.copyq;
            swayosd = getExe' config.services.swayosd.package "swayosd-client";
            valent = getExe pkgs.valent;
            easyeffects = getExe config.services.easyeffects.package;
            syncthingtray = getExe (
              pkgs.syncthingtray.overrideAttrs {
                meta.mainProgram = "syncthingtray";
              }
            );
          in
          {
            "Mod+Shift+q" = close-window;
            "Mod+q".action = spawn terminal;
            "Mod+e".action = spawn file-manager;
            "Mod+Shift+v".action = spawn [
              copyq
              "menu"
            ];
            "Mod+n".action = spawn valent;
            "Mod+a".action = spawn easyeffects;
            "caps_lock".action = spawn [
              swayosd
              "--caps-lock"
            ];
            "Mod+Shift+l".action = spawn [
              hyprlock
              "--immediate"
            ];
            "Mod+Shift+m".action = spawn [
              syncthingtray
              "-w"
            ];
            "Mod+m".action = spawn [
              terminal
              "--detach"
              btop
            ];
            "Mod+z".action = spawn [
              terminal
              "--detach"
              editor
            ];
            "Mod+r".action = spawn [
              terminal
              "--detach"
              yazi
            ];
            "Mod+Shift+E".action = quit;
            "Mod+Ctrl+Shift+E".action = quit { skip-confirmation = true; };
            "Print".action = screenshot;
            "Shift+Print".action = screenshot-screen;
            "Mod+F".action = fullscreen-window;
          }
        )
        (
          let
            s = getExe' config.services.swayosd.package "swayosd-client";
            mute = "${s} --output-volume mute-toggle";
            raise-volume = "${s} --output-volume raise";
            lower-volume = "${s} --output-volume lower";
            raise-brightness = "${s} --brightness raise";
            lower-brightness = "${s} --brightness lower";
          in
          {
            "XF86MonBrightnessUp".action = spawn raise-brightness;
            "XF86MonBrightnessDown".action = spawn lower-brightness;

            "XF86AudioRaiseVolume".action = spawn raise-volume;
            "XF86AudioLowerVolume".action = spawn lower-volume;
            "XF86AudioMute".action = spawn mute;
          }
        )
        (
          let
            p = getExe config.services.playerctld.package;
            next = "${p} next";
            prev = "${p} previous";
            toggle-play = "${p} play-pause";
            stop = "${p} stop";
          in
          {
            "XF86AudioPlay".action = spawn toggle-play;
            "XF86AudioStop".action = spawn stop;
            "XF86AudioPrev".action = spawn prev;
            "XF86AudioNext".action = spawn next;
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

            "Mod+i".action = sh "pkill iwgtk || ${iwgtk}";

            "Mod+Shift+c".action = sh "pkill color-picker || ${color-picker}";

            "Mod+x".action = sh "pkill wlogout || ${wlogout}";

            "Mod+p".action = sh "pkill pulsemixer || ${kitty} --class pulsemixer --detach pulsemixer";

            "Mod+Shift+i".action = sh "pkill overskride || ${overskride}";
          }
        )
      ];
  };
}
