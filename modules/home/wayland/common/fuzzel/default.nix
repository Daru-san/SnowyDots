{ config, lib, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = lib.getExe config.programs.foot.package;
        layer = "overlay";
        anchor = "center";
        width = 70;
        lines = 7;
        line-height = 24;
      };
      border = {
        width = 1;
        radius = 4;
      };
    };
  };
}
