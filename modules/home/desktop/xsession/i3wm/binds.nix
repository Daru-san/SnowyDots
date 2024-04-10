{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [./workspaces.nix];
  xsession.windowManager.i3.config = {
    modifier = "Mod4";
    bindkeysToCode = true;
    keybindings = with lib; let
      inherit (config.wayland.windowManager.sway.config) terminal;
      mod = config.wayland.windowManager.sway.config.modifier;
      yazi = getExe config.programs.yazi.package;
      playerctl = getExe config.services.playerctld.package;
      browser = getExe config.programs.firefox.package;
      launcher = config.wayland.windowManager.sway.config.menu;
      file-manager = getExe pkgs.gnome.nautilus;
      shotman = getExe pkgs.shotman;
      editor = getExe config.programs.snowvim.package;
      copyq = getExe config.services.copyq.package;
      easyeffects = getExe config.services.easyeffects.package;
    in {
      #Basic binds
      "${mod}+space" = "exec ${launcher} -show drun";
      "${mod}+return" = "exec ${terminal}";
      "${mod}+e" = "exec  ${file-manager}";
      "${mod}+b" = "exec  ${browser}";
      "${mod}+x" = "exec  ${laucher} -show powermenu";
      "${mod}+r" = "exec ${terminal} -e ${yazi}";
      "${mod}+z" = "exec ${terminal} -e ${editor}";
      "${mod}+a" = "exec  ${easyeffects}";

      #Window bings
      "alt+q" = "kill";
      "${mod}+shift+e" = "exit";
      "${mod}+v" = "floating toggle";
      "${mod}+f" = "fullscreen";

      #Clipboard menu
      "${mod}+shift+v" = "exec ${clipmenu} menu";

      #Suspend
      "${mod}+alt+F12" = "exec systemctl suspend";

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
      "alt+F8" = "exec ${swayosd} --output-volume=raise 5";
      "alt+F6" = "exec ${swayosd} --output-volume=lower 5";
      "alt+F7" = "exec ${swayosd} --output-volume=mute-toggle";

      #Show when caps lock is pressed
      "caps_lock" = "exec,${swayosd} --caps-lock";

      # Screenshotting
      "Print" = "exec ${shotman} --capture region";
      "shift+print" = "exec, ${shotman} --capture output";

      # Media control
      "XF86AudioNext" = "exec,${playerctl} next";
      "XF86AudioPrev" = "exec,${playerctl} previous";
      "XF86AudioPlay" = "exec,${playerctl} play-pause";
      "XF86AudioStop" = "exec,${playerctl} stop";

      #Same but for keyboards without media keys
      "alt+F12" = "exec,${playerctl} next";
      "alt+F9" = "exec,${playerctl} previous";
      "alt+F10" = "exec,${playerctl} play-pause";
      "alt+F11" = "exec,${playerctl} stop";
    };
  };
}
