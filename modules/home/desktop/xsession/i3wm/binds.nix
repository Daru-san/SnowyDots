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
      shotman = getExe pkgs.shotman;
      editor = getExe config.programs.snowvim.package;
      i3lock = getExe pkgs.i3lock;
      easyeffects = getExe config.services.easyeffects.package;
      clipmenu = getExe config.services.clipmenu.package;
    in {
      #Basic binds
      "${mod}+space" = "exec ${menu} -show drun";
      "${mod}+Return" = "exec ${terminal}";
      "${mod}+e" = "exec  ${file-manager}";
      "${mod}+b" = "exec  ${browser}";
      "${mod}+x" = "exec  ${menu} -show powermenu";
      "${mod}+r" = "exec ${terminal} -e ${yazi}";
      "${mod}+z" = "exec ${terminal} -e ${editor}";
      "${mod}+a" = "exec  ${easyeffects}";
      "${mod}+l" = "exec ${i3lock}";

      #Window bings
      "mod+q" = "kill";
      "${mod}+shift+e" = "exit";
      "${mod}+v" = "floating toggle";
      "${mod}+f" = "fullscreen";

      #Clipboard menu
      "${mod}+shift+v" = "exec ${clipmenu}";

      #Suspend
      "${mod}+alt+F12" = "exec systemctl suspend";

      ##Controls##
      ############

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
