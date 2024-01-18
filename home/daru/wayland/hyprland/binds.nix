{config, pkgs, inputs, lib, ...}:
with lib; 
{
  imports = [
    ./extra-binds.nix
  ];
  wayland.windowManager.hyprland.settings = let
    h = "${pkgs.hdrop}/bin/hdrop";
    e = "exec";
  in mkIf config.wayland.windowManager.hyprland.enable {
    bind = let
      terminal = "${config.programs.kitty.package}/bin/kitty";
      browser = "${config.programs.firefox.package}/bin/firefox-nightly";
      file-manager = "${pkgs.gnome.nautilus}/bin/nautilus";
      editor = "${config.programs.neovim.package}/bin/nvim";
      ranger = "${pkgs.ranger}/bin/ranger";
      image-editor = "${pkgs.krita}/bin/krita";
      swaylock = "${config.programs.swaylock.package}/bin/swaylock";
      copyq = "${config.services.copyq.package}/bin/copyq";
      btop = "${config.programs.btop.package}/bin/btop";
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
      "SUPER, l ,${e} , ${swaylock} -Ff"

      #Clipboard menu
      "SUPERSHIFT, v, ${e}, ${copyq} menu"

      #'Task manager'
      "SUPERALT,b,${e},${terminal} -T btop --hold ${btop}"
    ];

    bindle = let
      s = "${config.services.swayosd.package}/bin/swayosd";
      volup = "--output-volume=raise";
      voldown = "--output-volume=lower";
      volmute = "--output-volume=mute-toggle";
      brightup = "--brightness=raise";
      brightdown = "--brightness=lower";
    in [
     ### Controls using swayosd ###

      #// Might switch to ags //#

      ## Brightness control##

      # Brightness control using swayosd
      ",XF86MonBrightnessUp, ${e},${s} ${brightup} 5"
      ",XF86MonBrightnessDown, ${e},${s} ${brightdown} 5"

      ##Volume Control##

      # Volume using swayosd
      ",XF86AudioRaiseVolume, ${e}, ${s} ${volup} 5"
      ",XF86AudioLowerVolume, ${e}, ${s} ${voldown} 5"
      ",XF86AudioMute, ${e}, ${s} ${volmute}"

      #Same but for keyboards without media keys
      "ALT,F8, ${e}, ${s} ${volup} 5"
      "ALT,F6, ${e}, ${s} ${voldown} 5"
      "ALT,F7, ${e}, ${s} ${volmute}"
    ];

    bindl = let 
      p = "${config.services.playerctld.package}/bin/playerctl";
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
      any = "${config.programs.anyrun.package}/bin/anyrun";
      easy = "${config.services.easyeffects.package}/bin/easyeffects";
      cl = "${inputs.useful-scripts.packages.${pkgs.system}.color-picker}/bin/color-picker";
      s = "${config.services.swayosd.package}/bin/swayosd";
      wl = "${config.programs.wlogout.package}/bin/wlogout";
      pk = "pkill";

      # Screenshots 
      hs = "${pkgs.hyprshot}/bin/hyprshot";
      scr-dir = "${config.home.homeDirectory}/Pictures/Screenshots";
      r = "region";
      o = "output";
    in [
      # Launch the launcher - anyrun
      "super, space, ${e}, ${pk} ${any} || ${any}"

      # Launch easyeffects
      "super, a, ${e}, ${h} '${easy}'"

      # Show when caps lock is pressed
      ",caps_lock,${e},${s} --caps-lock"

      # Color picker
      "supershift, c, ${e}, ${pk} ${cl} || ${cl}"

      # wlogout
      "super, x, ${e}, ${pk} ${wl} || ${wl}"

      # Screenshotting
      ", print, ${e}, ${pk} ${hs} || ${h} '${hs} -m ${r} -o ${scr-dir}'"
      "shift, print, ${e}, ${pk} ${hs} || ${h} '${hs} -m ${o} -c -o ${scr-dir}'"
      "alt, print, ${e}, ${pk} ${hs} || ${h} '${hs} -m ${o} -o ${scr-dir}'"     
    ];
  };
}
