{config, pkgs, inputs, lib, ...}:
with lib; 
{
  imports = [
    ./extra-binds.nix
  ];
  wayland.windowManager.hyprland.settings = let
    h = "${getExe pkgs.hdrop}";
    e = "exec";
  in mkIf config.wayland.windowManager.hyprland.enable {
    bind =
    with lib;
    let
      terminal = "${getExe config.programs.kitty.package}";
      browser = "${getExe config.programs.firefox.package}";
      file-manager = "${getExe pkgs.gnome.nautilus}";
      editor = "${getExe config.programs.neovim.package}";
      ranger = "${getExe pkgs.ranger}";
      image-editor = "${getExe' pkgs.krita "krita"}";
      swaylock = "${getExe config.programs.swaylock.package}";
      gtklock = "${getExe pkgs.gtklock}";
      copyq = "${getExe config.services.copyq.package}";
      btop = "${getExe config.programs.btop.package}";
      swayosd = "${getExe' config.services.swayosd.package "swayosd-client"}";
      swww = "${getExe pkgs.swww}";
    in [
      # Launching programs
      "SUPER, e, ${e}, ${h} '${file-manager}'"
      "SUPERSHIFT, f, ${e}, ${h} '${browser}'"
      "SUPER, i, ${e}, ${h} '${image-editor}'"

      # Terminal stuff
      "SUPER, Return, ${e}, ${terminal}"
      "SUPER, r, ${e}, ${terminal} --hold ${ranger}"
      "SUPER, z, ${e}, ${terminal} --hold ${editor}"

      #Window bings
      "alt,q,killactive"
      "SUPERSHIFT,e,exit"
      "SUPER,s,togglesplit"
      "SUPER,f,fullscreen"
      "SUPER,v,togglefloating"


      #Lock screen
      "SUPER, l ,${e} , ${gtklock} -id"

      #Clipboard menu
      "SUPERSHIFT, v, ${e}, ${copyq} menu"

      #'Task manager'
      "SUPERALT,b,${e},${terminal} -T btop --hold ${btop}"
      
      # Show when caps lock is pressed
      ",caps_lock,${e},${swayosd} --caps-lock"

      # Switch the wallpaper from a list of wallpapers in a repo
      # "CTRLSHIFT,F12,${e},swww-switch"
    ];

    bindle = 
    with lib;
    let
      s = "${getExe' config.services.swayosd.package "swayosd-client"}";
      volup = "--output-volume raise";
      voldown = "--output-volume lower";
      volmute = "--output-volume mute-toggle";
      brightup = "--brightness raise";
      brightdown = "--brightness lower";
    in [
     ### Controls using swayosd ###

      #// Might switch to ags //#

      ## Brightness control##

      # Brightness control using swayosd
      ",XF86MonBrightnessUp, ${e},${s} ${brightup}"
      ",XF86MonBrightnessDown, ${e},${s} ${brightdown}"

      ##Volume Control##

      # Volume using swayosd
      ",XF86AudioRaiseVolume, ${e}, ${s} ${volup}"
      ",XF86AudioLowerVolume, ${e}, ${s} ${voldown}"
      ",XF86AudioMute, ${e}, ${s} ${volmute}"

      #Same but for keyboards without media keys
      "ALT,F8, ${e}, ${s} ${volup}"
      "ALT,F6, ${e}, ${s} ${voldown}"
      "ALT,F7, ${e}, ${s} ${volmute}"
    ];

    bindl = let 
      p = "${getExe config.services.playerctld.package}";
      nx = "next";
      pv = "previous";
      pl = "play-pause";
      st = "stop";
    in [
      ### Media Control using playerctl ###

      ",XF86AudioNext,${e},${p} ${nx}"
      ",XF86AudioPrev,${e},${p} ${pv}"
      ",XF86AudioPlay,${e},${p} ${pl}"
      ",XF86AudioStop,${e},${p} ${st}"

      #Same but for keyboards without media keys
      "ALT,F12,${e},${p} ${nx}"
      "ALT,F9,${e},${p} ${pv}"
      "ALT,F10,${e},${p} ${pl}"
      "ALT,F11,${e},${p} ${st}"
    ];

    bindr = let
      any = "${getExe' config.programs.anyrun.package "anyrun"}";
      easy = "${getExe config.services.easyeffects.package}";
      cl = "${getExe inputs.scripts.packages.${pkgs.system}.color-picker}";
      wl = "${getExe config.programs.wlogout.package}";
      pk = "pkill";

      # Screenshots 
      hs = "${getExe pkgs.hyprshot}";
      scr-dir = "${config.home.homeDirectory}/Pictures/Screenshots";
      r = "region";
      o = "output";

      sc = "${getExe' pkgs.swaynotificationcenter "swaync-client"}";
    in [
      # Launch the launcher - anyrun
      "super, space, ${e}, ${pk} ${any} || ${any}"

      # Launch easyeffects
      "super, a, ${e}, ${h} '${easy}'"

      # Color picker
      "supershift, c, ${e}, ${pk} ${cl} || ${cl}"

      # wlogout
      "super, x, ${e}, ${pk} ${wl} || ${wl}"

      # Screenshotting
      ", print, ${e}, ${pk} ${hs} || ${h} '${hs} -m ${r} -o ${scr-dir}'"
      "shift, print, ${e}, ${pk} ${hs} || ${h} '${hs} -m ${o} -c -o ${scr-dir}'"
      "alt, print, ${e}, ${pk} ${hs} || ${h} '${hs} -m ${o} -o ${scr-dir}'"

      "super,n, ${e}, ${sc} -t"
      "supershift,n, ${e}, ${sc} -d"
      "superalt,n, ${e}, ${sc} -C"
    ];
  };
}
