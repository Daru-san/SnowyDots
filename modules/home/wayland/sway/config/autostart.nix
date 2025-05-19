{
  pkgs,
  lib,
  config,
  ...
}:
{
  wayland.windowManager.sway.config.startup = [
    { command = lib.getExe pkgs.ghostty + " --title=btop -e " + lib.getExe pkgs.btop; }
    { command = lib.getExe config.services.clipse.package + " --listen-shell"; }
    { command = lib.getExe pkgs.flameshot; }
    { command = lib.getExe pkgs.stable.planify + " -b"; }
  ];
}
