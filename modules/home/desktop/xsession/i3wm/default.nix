{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  xsession.windowManager.i3 = {
    package = pkgs.i3-rounded;
    config = {
      terminal = getExe config.programs.alacritty.package;
      menu = getExe config.programs.rofi.package;
    };
  };
}
