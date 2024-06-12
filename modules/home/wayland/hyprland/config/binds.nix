{
  config,
  pkgs,
  system,
  inputs,
  lib,
  ...
}: let
  inherit (lib) getExe getExe';
  inherit (pkgs) formats writeShellScriptBin;
  idle-inhibit = getExe (writeShellScriptBin "idle-inhibit" ''
    inhibited=off
    if pgrep 'hypridle'; then
      systemctl --user stop hypridle.service
      inhibited=on
    else
      systemctl --user start hypridle.service
      inhibited=off
    fi
    hyprctl notify -1 6000 0 "Idle inhibiting is now ''${inhibited}"
  '');
in {
  imports = [./extra-binds.nix];
  wayland.windowManager.hyprland.settings = let
    h = getExe pkgs.hdrop;
    e = "exec";

    # Normal (hyprland) binds
    mkBind = x: y: z: "${x},${y},${z}";
    # Binds that execute programs
    mkBindE = x: y: z: "${x},${y},${e},${z}";
    # Binds with singular keys
    mkBindSE = y: z: ",${y},${e},${z}";
    # Binds which use `hdrop` to only launch one instance
    mkBindH = x: y: z: "${x},${y},${e},${h} '${z}'";
  in
    lib.mkIf config.wayland.windowManager.hyprland.enable {
      bind = let
        terminal = getExe config.programs.kitty.package;
        browser = getExe config.programs.firefox.package;
        file-manager = getExe pkgs.gnome.nautilus;
        editor = "nvim";
        yazi = getExe config.programs.yazi.package;
        hyprlock = getExe config.programs.hyprlock.package;
        btop = getExe config.programs.btop.package;
        copyq = getExe pkgs.copyq;
        swayosd = getExe' config.services.swayosd.package "swayosd-client";
        g4music = getExe pkgs.g4music;
      in [
        # Launching programs
        (mkBindH "super" "e" "hyprctl clients | grep 'nautilus' || ${file-manager}")
        (mkBindH "super" "b" browser)
        (mkBindH "altshift" "m" g4music)

        # Terminal stuff
        (mkBindE "super" "q" terminal)
        (mkBindE "super" "r" "${terminal} --hold ${yazi}")
        (mkBindE "super" "z" "${terminal} --hold ${editor}")
        (mkBindE "super" "m" "${terminal} --hold ${btop}")

        # Clipboard menu
        (mkBindE "supershift" "v" "${copyq} menu")

        #Window bings
        (mkBind "supershift" "q" "killactive")
        (mkBind "supershift" "e" "exit")
        (mkBind "super" "s" "togglesplit")
        (mkBind "super" "f" "fullscreen")
        (mkBind "super" "v" "togglefloating")
        (mkBindE "supershift" "x" "hyprctl reload")

        #Lock screen
        (mkBindE "super" "l" "${hyprlock} --immediate")

        # Show when caps lock is pressed
        (mkBindSE "caps_lock" "${swayosd} --caps-lock")

        # Show active workspace
        (mkBindE "super" "w" "hyprctl notify -1 2000 0 `hyprctl activeworkspace | head -n 1`")

        # Prevent idling
        (mkBindE "super" "grave" idle-inhibit)
      ];

      bindle = let
        s = getExe' config.services.swayosd.package "swayosd-client";
        mute = "${s} --output-volume mute-toggle";
        raise-volume = "${s} --output-volume raise";
        lower-volume = "${s} --output-volume lower";
        raise-brightness = "${s} --brightness raise";
        lower-brightness = "${s} --brightness lower";
      in [
        (mkBindSE "XF86MonBrightnessUp" raise-brightness)
        (mkBindSE "XF86MonBrightnessDown" lower-brightness)

        (mkBindSE "XF86AudioRaiseVolume" raise-volume)
        (mkBindSE "XF86AudioLowerVolume" lower-volume)
        (mkBindSE "XF86AudioMute" mute)

        (mkBindE "shift" "F8" raise-volume)
        (mkBindE "shift" "F6" lower-volume)
        (mkBindE "shift" "F7" mute)
      ];

      bindl = let
        p = getExe config.services.playerctld.package;
        next = "${p} next";
        prev = "${p} previous";
        toggle-play = "${p} play-pause";
        stop = "${p} stop";
      in [
        (mkBindSE "XF86AudioNext" next)
        (mkBindSE "XF86AudioPrev" prev)
        (mkBindSE "XF86AudioPlay" toggle-play)
        (mkBindSE "XF86AudioStop" stop)

        (mkBindE "shift" "F12" next)
        (mkBindE "shift" "F9" prev)
        (mkBindE "shift" "F10" toggle-play)
        (mkBindE "shift" "F11" stop)
      ];

      bindr = let
        fuzzel = getExe config.programs.fuzzel.package;
        easyeffects = getExe config.services.easyeffects.package;
        color-picker = getExe inputs.color-picker.packages.${system}.default;
        wlogout = getExe config.programs.wlogout.package;
        waybar = getExe config.programs.waybar.package;
        pk = getExe' pkgs.busybox "pkill";

        # Screenshots
        shotman = getExe pkgs.shotman;

        mx = getExe pkgs.mixxc;

        iniFormat = formats.ini {};
        foot-config = iniFormat.generate "foot.ini" {
          main.font = "JetbrainsMono Nerd Font:size=14";
        };
        iwgtk = getExe pkgs.iwgtk;
        bluetuith = getExe pkgs.bluetuith;
        foot = getExe pkgs.foot;
        blue-ui = "${foot} -c ${foot-config} --title bluetooth-tui -e ${bluetuith}";

        swaync = getExe' pkgs.swaynotificationcenter "swaync-client";

        ags = getExe config.programs.ags.package;
      in [
        # Launch the launcher - fuzzel
        (mkBindE "super" "d" "${pk} fuzzel || ${fuzzel}")

        # Waybar
        (mkBindE "superalt" "b" "${pk} ags || ${ags}")

        # Launch easyeffects
        (mkBindH "super" "a" "hyprctl clients | grep 'easyeffects' || ${easyeffects}")

        # Color picker
        (mkBindE "supershift" "c" "${pk} color-picker || ${color-picker}")

        # wlogout
        (mkBindE "super" "x" "${pk} wlogout || ${wlogout}")

        # Audio mixer
        (mkBindE "altshift" "F7" "${pk} mixxc || ${mx} --anchor right --anchor top --margin 20 --margin 30 -M")

        # Screenshotting
        (mkBindSE "print" "${pk} shotman || ${shotman} --capure region")
        (mkBindE "alt" "print" "${pk} shotman || ${shotman} --capture output")

        # Notifcations
        (mkBindE "super" "n" "${swaync} -t")
        (mkBindE "supershift" "n" "${swaync} -d")
        (mkBindE "superalt" "n" "${swaync} -C")

        # Lauch useful stuff
        (mkBindE "super" "i" "${pk} iwgtk || ${iwgtk}")
        (mkBindE "supershift" "i" blue-ui)
      ];
    };
}
