{config, pkgs,...}:{
  imports = [
    ./extra-binds.nix
  ];
  wayland.windowManager.sway.config = 
  {
    modifier = "mod4";
    keybindings = let
      mod = "${config.wayland.windowManager.sway.config.modifier}";
      swayosd = "${config.services.swayosd.package}/bin/swayosd";
      playerctl = "${config.services.playerctld.package}/bin/playerctl";
      playerctld = "${config.services.playerctld.package}/bin/playerctld";
      browser = "${config.programs.firefox.package}/bin/firefox-nightly";
      terminal = "${config.wayland.windowManager.sway.config.terminal}";
      launcher = "${config.wayland.windowManager.sway.config.menu}";
      file-manager = "${pkgs.libsForQt5.dolphin}/bin/dolphin";
      shotman = "${pkgs.shotman}/bin/shotman";
      editor = "${config.programs.neovim.package}/bin/nvim";
      ranger = "${pkgs.ranger}/bin/ranger";
      image-editor = "${pkgs.krita}/bin/krita";
      hdrop = "${inputs.hyprland-contrib.packages.${pkgs.system}.hdrop}/bin/hdrop";
      swaylock = "${config.programs.swaylock.package}/bin/swaylock";
      copyq = "${config.services.copyq.package}/bin/copyq";
      wlogout = "${config.programs.wlogout.package}/bin/wlogout";
      hyprpicker = "${pkgs.hyprpicker}/bin/hyprpicker";
      wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
      wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
      notify-send = "${pkgs.libnotify}/bin/notify-send";
      easyeffects = "${config.services.easyeffects.package}/bin/easyeffects";
    in lib.mkOptionDefault {
      #Basic binds
      "${mod} + space" = "exec ${launcher}";
      "${mod} + Return" = "exec ${terminal}";
      "${mod} + e" = "exec ${hdrop} '${file-manager}'";
      "${mod} + b" = "exec ${hdrop} '${browser}'";
      "${mod} + x" = "exec ${hdrop} '${wlogout}'";
      "${mod} + r" = "exec ${terminal} --hold ${ranger}";
      "${mod} + z" = "exec ${terminal} --hold ${editor}";
      "${mod} + a" = "exec ${hdrop} '${easyeffects}"';

      #Window bings
      "alt + q" = "killactive";
      "${mod} + shift + e" = "exit";
      "${mod} + f" = "fullscreen";
      "${mod} + v" = "togglefloating";


      #Lock screen
      "${mod} + l" = "exec ${swaylock} -Ff";

      #Clipboard menu
      "${mod} + shift + v" = "exec ${copyq} menu";
      
      #Suspend
      "${mod} + alt + F12" = "exec systemctl suspend"

      #Color picker
      "${mod} + shift + c" = "exec ${notify-send} 'Color copied to clipboard' `${hyprpicker} | ${wl-copy}` `${wl-paste}`";

      #'Task manager'
      "${mod} + P" = "exec ${terminal} -T SystemMonitor --session SystemMonitor.conf"

      ##Controls##
      ############

      #Brightness controll#

      # Brightness control using swayosd
      "XF86MonBrightnessUp" = "exec,${swayosd} --brightness=raise 5";
      "XF86MonBrightnessDown" = "exec,${swayosd} --brightness=lower 5";

      ##Volume Control##
      # Volume using swayosd
      "XF86AudioRaiseVolume" = "exec ${swayosd} --output-volume=raise 5";
      "XF86AudioLowerVolume" = "exec ${swayosd} --output-volume=lower 5";
      "XF86AudioMute" = "exec ${swayosd} --output-volume=mute-toggle";

      #Same but for keyboards without media keys
      "alt + F8" = "exec ${swayosd} --output-volume=raise 5";
      "alt + F6" = "exec ${swayosd} --output-volume=lower 5";
      "alt + F7" = "exec ${swayosd} --output-volume=mute-toggle";


      #Show when caps lock is pressed
      ",caps_lock,exec,${swayosd} --caps-lock";

      # Screenshotting
      "Print" = "exec ${shotman} --capture region";
      "shift + print" = "exec, ${shotman} --capture output";

      # Media control
      "XF86AudioNext" = "exec,${playerctl} next";
      "XF86AudioPrev" = "exec,${playerctl} previous";
      "XF86AudioPlay" = "exec,${playerctl} play-pause";
      "XF86AudioStop" = "exec,${playerctl} stop";

      #Same but for keyboards without media keys
      "alt + F12" = "exec,${playerctl} next";
      "alt + F9" = "exec,${playerctl} previous";
      "alt + F10" = "exec,${playerctl} play-pause";
      "alt + F11" = "exec,${playerctl} stop";
    };
  };
}
