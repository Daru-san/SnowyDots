{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ (lib.getExe pkgs.copyq) ]; }
      { command = [ (lib.getExe config.programs.kitty.package) ]; }
      { command = [ (lib.getExe pkgs.xwayland-satellite) ]; }
      { command = [ "systemctl --user restart snowy-shell" ]; }
      { command = [ "systemctl --user restart swww-daemon" ]; }
      { command = [ "systemctl --user restart hypridle" ]; }
      { command = [ "systemctl --user restart avizo" ]; }
      { command = [ "systemctl --user restart wlsunset" ]; }
      { command = [ (lib.getExe pkgs.swww + " img ${config.wallpaperImage}") ]; }
    ];
  };
}
