{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.xsession;
in {
  imports = [./redshift ./dunst ./i3wm ./polybar];
  config = mkIf cfg.enable {
    xsession.windowManager.i3.enable = true;
    programs = {
      rofi.enable = true;
      alacritty.enable = true;
    };
    home = {
      pointerCursor.x11.enable = true;
      sessionVariables.CM_LAUNCHER = "rofi";
    };
    services = {
      dunst.enable = true;
      redshift.enable = true;
      copyq.enable = true;
    };
  };
}
