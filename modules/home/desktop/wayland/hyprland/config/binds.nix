{
  config,
  pkgs,
  system,
  inputs,
  lib,
  ...
}: let
  inherit (lib) getExe getExe';
  focusmode = pkgs.writeShellScriptBin "focusmode" ''
    HYPRFOCUSMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
    if [ "$HYPRFOCUSMODE" = 1 ] ; then
      hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
      exit
    fi
    hyprctl reload
  '';
in {
  imports = [./extra-binds.nix];
  wayland.windowManager.hyprland.settings = let
    h = getExe pkgs.hdrop;
    e = "exec";
  in
    lib.mkIf config.wayland.windowManager.hyprland.enable {
      bind = let
        terminal = getExe config.programs.kitty.package;
        browser = getExe config.programs.firefox.package;
        file-manager = getExe pkgs.gnome.nautilus;
        editor = "nvim";
        yazi = getExe config.programs.yazi.package;
        image-editor = getExe' pkgs.krita "krita";
        hyprlock = getExe config.programs.hyprlock.package;
        btop = getExe config.programs.btop.package;
        swayosd = getExe' config.services.swayosd.package "swayosd-client";
      in [
        # Launching programs
        "SUPER, e, ${e}, ${h} '${file-manager}'"
        "SUPERSHIFT, f, ${e}, ${h} '${browser}'"
        "SUPER, i, ${e}, ${h} '${image-editor}'"

        # Terminal stuff
        "SUPER, Return, ${e}, ${terminal}"
        "SUPER, r, ${e}, ${terminal} --hold ${yazi}"
        "SUPER, z, ${e}, ${terminal} --hold ${editor}"
        "SUPER, m, ${e}, ${terminal} --hold ${btop}"

        #Window bings
        "alt,q,killactive"
        "SUPERSHIFT,e,exit"
        "SUPER,s,togglesplit"
        "SUPER,f,fullscreen"
        "SUPER,v,togglefloating"

        # Toggle focus mode
        "SUPERALT,F12,exec,${getExe focusmode}"

        #Lock screen
        "SUPER, l ,${e} , ${hyprlock} --immediate"

        #Clipboard menu
        "SUPERSHIFT, v, ${e},clipse-manager"

        # Show when caps lock is pressed
        ",caps_lock,${e},${swayosd} --caps-lock"

        # Switch the wallpaper from a list of wallpapers in a repo
        # "CTRLSHIFT,F12,${e},swww-switch"

        "SUPER, w, ${e}, hyprctl notify -1 2000 0 `hyprctl activeworkspace | head -n 1`"
      ];

      bindle = let
        s = getExe' config.services.swayosd.package "swayosd-client";
        volup = "--output-volume raise";
        voldown = "--output-volume lower";
        volmute = "--output-volume mute-toggle";
        brightup = "--brightness raise";
        brightdown = "--brightness lower";
      in [
        ",XF86MonBrightnessUp, ${e},${s} ${brightup}"
        ",XF86MonBrightnessDown, ${e},${s} ${brightdown}"

        ",XF86AudioRaiseVolume, ${e}, ${s} ${volup}"
        ",XF86AudioLowerVolume, ${e}, ${s} ${voldown}"
        ",XF86AudioMute, ${e}, ${s} ${volmute}"

        "ALT,F8, ${e}, ${s} ${volup}"
        "ALT,F6, ${e}, ${s} ${voldown}"
        "ALT,F7, ${e}, ${s} ${volmute}"
      ];

      bindl = let
        p = getExe config.services.playerctld.package;
        nx = "next";
        pv = "previous";
        pl = "play-pause";
        st = "stop";
      in [
        ",XF86AudioNext,${e},${p} ${nx}"
        ",XF86AudioPrev,${e},${p} ${pv}"
        ",XF86AudioPlay,${e},${p} ${pl}"
        ",XF86AudioStop,${e},${p} ${st}"

        "ALT,F12,${e},${p} ${nx}"
        "ALT,F9,${e},${p} ${pv}"
        "ALT,F10,${e},${p} ${pl}"
        "ALT,F11,${e},${p} ${st}"
      ];

      bindr = let
        any = getExe' config.programs.anyrun.package "anyrun";
        easy = getExe config.services.easyeffects.package;
        cl = getExe inputs.scripts.packages.${system}.color-picker;
        wl = getExe config.programs.wlogout.package;
        pk = getExe' pkgs.busybox "pkill";

        # Screenshots
        gb = getExe inputs.hyprland-contrib.packages.${system}.grimblast;
        hs = getExe pkgs.hyprshot;
        scr-dir = "${config.home.homeDirectory}/Pictures/Screenshots";
        r = "region";
        o = "output";

        mx = getExe pkgs.mixxc;

        sc = getExe' pkgs.swaynotificationcenter "swaync-client";
      in [
        # Launch the launcher - anyrun
        "super, space, ${e}, ${pk} anyrun || ${any}"

        # Launch easyeffects
        "super, a, ${e}, ${h} '${easy}'"

        # Color picker
        "supershift, c, ${e}, ${pk} color-picker || ${cl}"

        # wlogout
        "super, x, ${e}, ${pk} wlogout || ${wl}"

        # Audio mixer
        "altshift,F7,${e},${pk} mixxc || ${mx} --anchor right --anchor top --margin 20 --margin 30 -M"

        # Screenshotting
        ", print, ${e}, ${pk} grimblast || ${gb} -n -f save area"
        "shift, print, ${e}, ${pk} grimblast || ${gb} -n -f save active"
        "alt, print, ${e}, ${pk} grimblast || ${gb} -n -f save output"

        # Notifcations
        "super,n, ${e}, ${sc} -t"
        "supershift,n, ${e}, ${sc} -d"
        "superalt,n, ${e}, ${sc} -C"
      ];
    };
}
