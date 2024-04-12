{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [./workspaces.nix];
  xsession.windowManager.i3.config = {
    modifier = "Mod4";
    keybindings = with lib; let
      inherit (config.xsession.windowManager.i3.config) terminal menu;
      mod = config.wayland.windowManager.sway.config.modifier;
      yazi = getExe config.programs.yazi.package;
      playerctl = getExe config.services.playerctld.package;
      browser = getExe config.programs.firefox.package;
      file-manager = getExe pkgs.pcmanfm-qt;
      copyq = getExe config.services.copyq.package;
      editor = getExe config.programs.snowvim.package;
      i3lock = getExe pkgs.i3lock;
      easyeffects = getExe config.services.easyeffects.package;
    in {
      #Basic binds
      "${mod}+space" = "exec ${menu} -show drun -theme ~/.config/rofi/theme.rasi";
      "${mod}+shift+c" = "exec ${menu} -show calc -theme ~/.config/rofi/theme.rasi";
      "${mod}+Return" = "exec ${terminal}";
      "${mod}+e" = "exec  ${file-manager}";
      "${mod}+b" = "exec  ${browser}";
      "${mod}+x" = "exec  rofi-power";
      "${mod}+r" = "exec ${terminal} -e ${yazi}";
      "${mod}+z" = "exec ${terminal} -e ${editor}";
      "${mod}+a" = "exec  ${easyeffects}";
      "${mod}+l" = "exec ${i3lock}";
      "${mod}+p" = "exec ${menu} -show top -theme ~/.config/rofi/theme.rasi";

      #Window bings
      "Mod1+q" = "kill";
      "${mod}+shift+e" = "exit";
      "${mod}+v" = "floating toggle";
      "${mod}+f" = "fullscreen";

      #Clipboard menu
      "${mod}+shift+v" = "exec ${copyq} menu";

      #Suspend
      "${mod}+alt+F12" = "exec systemctl suspend";

      ##Controls##
      ############
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
