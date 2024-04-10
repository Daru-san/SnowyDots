{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.xsession;
in {
  imports = [./redshift ./dunst ./i3wm];
  config = mkIf cfg.enable {
    xsession.windowManager.i3.enable = true;
    programs.rofi.enable = true;
    home.pointerCursor.x11.enable = true;
    services = {
      dunst.enable = true;
      redshift.enable = true;
    };
  };
}
