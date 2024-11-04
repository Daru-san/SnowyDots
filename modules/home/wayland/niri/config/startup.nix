{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      { command = lib.getExe pkgs.swww + " img ${config.wallpaperImage}"; }
      { command = lib.getExe pkgs.copyq; }
      { command = lib.getExe config.programs.kitty.package; }
    ];
  };
}
