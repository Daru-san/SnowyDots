{config, pkgs, inputs,...}:{
  imports = [
    ./extra-binds.nix
  ];
  wayland.windowManager.hyprland.settings = {
    bind = let
      swayosd = "${config.services.swayosd.package}/bin/swayosd";
      rofi = "${config.programs.rofi.package}/bin/rofi";
      rofi-bluetooth = "${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";
      playerctl = "${config.services.playerctld.package}/bin/playerctl";
      playerctld = "${config.services.playerctld.package}/bin/playerctld";
      terminal = "${config.programs.kitty.package}/bin/kitty";
      browser = "${config.programs.firefox.package}/bin/firefox-nightly";
      file-manager = "${pkgs.gnome3.nautilus}/bin/nautilus";
      shotman = "${pkgs.shotman}/bin/shotman";
      editor = "${config.programs.neovim.package}/bin/nvim";
      ranger = "${pkgs.ranger}/bin/ranger";
      power-menu = "rofi-power-menu";
      image-editor = "${pkgs.pinta}/bin/pinta";
      hdrop = "${inputs.hyprland-contrib.packages.${pkgs.system}.hdrop}/bin/hdrop";
      swaylock = "${config.programs.swaylock.package}/bin/swaylock";
      copyq = "${config.services.copyq.package}/bin/copyq";
      fuzzel = "${config.programs.fuzzel.package}/bin/fuzzel"
    in [
      #Basic binds
      "SUPER,space,exec, ${fuzzel}"
      "SUPER, Return, exec, ${terminal}"
      "SUPER, e, exec, ${hdrop} '${file-manager}'"
      "SUPER, b, exec, ${rofi-bluetooth}"
      "SUPERALT, b, exec, ${hdrop} '${browser}'"
      "SUPER, x, exec, ${power-menu}"
      "SUPER, r, exec, ${terminal} --hold ranger"
      "SUPER, z, exec, ${terminal} --hold vi"
      "SUPER, i, exec, ${hdrop} '${image-editor}'"

      #Window bings
      "alt,q,killactive"
      "SUPERSHIFT,e,exit"
      "SUPER,s,togglesplit"
      "SUPER,f,fullscreen"
      "SUPER,v,togglefloating"

      #Show power menu
      "SUPER ,x,exec, rofi-power-menu"

      #Lock screen
      "SUPER, l ,exec , ${swaylock} -Ff"

      #Clipboard menu
      "SUPERSHIFT, v, exec, ${copyq} menu"

      #Show rofi top
      "SUPER, p, exec, rofi -show top"
      #Show rofi window
      "SUPER,tab, exec, ${rofi} -show window"

      #'Task manager'
      "SUPERSHIFT,P,exec,${terminal} -T SystemMonitor --session SystemMonitor.conf"

      # Brightness control using swayosd
      ",XF86MonBrightnessUp, exec,${swayosd} --brightness=raise 5"
      ",XF86MonBrightnessDown, exec,${swayosd} --brightness=lower 5"
      # Volume using swayosd
      ",XF86AudioRaiseVolume, exec, ${swayosd} --output-volume=raise 5"
      ",XF86AudioLowerVolume, exec, ${swayosd} --output-volume=lower 5"
      ",XF86AudioMute, exec, ${swayosd} --output-volume=mute-toggle"

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
    ];
  };
}
