{config, pkgs, inputs,...}:{
  imports = [
    ./extra-binds.nix
  ];
  wayland.windowManager.hyprland.settings = {
    bind = let
      swayosd = "${config.services.swayosd.package}/bin/swayosd";
      playerctl = "${config.services.playerctld.package}/bin/playerctl";
      playerctld = "${config.services.playerctld.package}/bin/playerctld";
      terminal = "${config.programs.kitty.package}/bin/kitty";
      browser = "${config.programs.firefox.package}/bin/firefox-nightly";
      file-manager = "${pkgs.libsForQt5.dolphin}/bin/dolphin";
      shotman = "${pkgs.shotman}/bin/shotman";
      editor = "${config.programs.neovim.package}/bin/nvim";
      ranger = "${pkgs.ranger}/bin/ranger";
      image-editor = "${pkgs.krita}/bin/krita";
      hdrop = "${inputs.hyprland-contrib.packages.${pkgs.system}.hdrop}/bin/hdrop";
      swaylock = "${config.programs.swaylock.package}/bin/swaylock";
      copyq = "${config.services.copyq.package}/bin/copyq";
      fuzzel = "${config.programs.fuzzel.package}/bin/fuzzel";
      wlogout = "${config.programs.wlogout.package}/bin/wlogout";
      hyprpicker = "${pkgs.hyprpicker}/bin/hyprpicker";
      wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
      wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
      notify-send = "${pkgs.libnotify}/bin/notify-send";
    in [
      #Basic binds
      "SUPER,space,exec, ${fuzzel} -D no"
      "SUPER, Return, exec, ${terminal}"
      "SUPER, e, exec, ${hdrop} '${file-manager}'"
      "SUPER, b, exec, ${rofi-bluetooth}"
      "SUPERALT, b, exec, ${hdrop} '${browser}'"
      "SUPER, x, exec, ${wlogout}"
      "SUPER, r, exec, ${terminal} --hold ${ranger}"
      "SUPER, z, exec, ${terminal} --hold ${editor}"
      "SUPER, i, exec, ${hdrop} '${image-editor}'"

      #Window bings
      "alt,q,killactive"
      "SUPERSHIFT,e,exit"
      "SUPER,s,togglesplit"
      "SUPER,f,fullscreen"
      "SUPER,v,togglefloating"


      #Lock screen
      "SUPER, l ,exec , ${swaylock} -Ff"

      #Clipboard menu
      "SUPERSHIFT, v, exec, ${copyq} menu"
      
      #Suspend
      "SUPERALT, F12, exec, systemctl suspend"

      #Color picker
      "SUPERSHIFT,c,exec,${notify-send} 'Color copied to clipboard' `${hyprpicker} | ${wl-copy}` `${wl-paste}`"

      #'Task manager'
      "SUPERSHIFT,P,exec,${terminal} -T SystemMonitor --session SystemMonitor.conf"

      ##Controls##
      ############

      #Brightness controll#

      # Brightness control using swayosd
      ",XF86MonBrightnessUp, exec,${swayosd} --brightness=raise 5"
      ",XF86MonBrightnessDown, exec,${swayosd} --brightness=lower 5"

      ##Volume Control##
      # Volume using swayosd
      ",XF86AudioRaiseVolume, exec, ${swayosd} --output-volume=raise 5"
      ",XF86AudioLowerVolume, exec, ${swayosd} --output-volume=lower 5"
      ",XF86AudioMute, exec, ${swayosd} --output-volume=mute-toggle"

      #Same but for keyboards without media keys
      "ALT,F8, exec, ${swayosd} --output-volume=raise 5"
      "ALT,F6, exec, ${swayosd} --output-volume=lower 5"
      "ALT,F7, exec, ${swayosd} --output-volume=mute-toggle"


      #Show when caps lock is pressed
      ",caps_lock,exec,${swayosd} --caps-lock"

      # Screenshotting
      ",Print,exec, ${shotman} --capture region"
      "SHIFT, print,exec, ${shotman} --capture output"

      # Media control
      ",XF86AudioNext,exec,${playerctl} next"
      ",XF86AudioPrev,exec,${playerctl} previous"
      ",XF86AudioPlay,exec,${playerctl} play-pause"
      ",XF86AudioStop,exec,${playerctl} stop"
      "ALT,XF86AudioNext,exec,${playerctld} shift"
      "ALT,XF86AudioPrev,exec,${playerctld} unshift"
      "ALT,XF86AudioPlay,exec,systemctl --user restart playerctld"

      #Same but for keyboards without media keys
      "ALT,F12,exec,${playerctl} next"
      "ALT,F9,exec,${playerctl} previous"
      "ALT,F10,exec,${playerctl} play-pause"
      "ALT,F11,exec,${playerctl} stop"
    ];
  };
}
