{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      {
        command = [
          "systemctl"
          "--user"
          "start"
          "niri-session.target"
        ];
      }
      { command = [ (lib.getExe pkgs.copyq) ]; }
      {
        command = [
          (lib.getExe config.programs.ghostty.package)
          "-e"
          (lib.getExe config.programs.btop.package)
        ];
      }
      { command = [ (lib.getExe pkgs.xwayland-satellite) ]; }
      { command = [ (lib.getExe' config.services.swayosd.package "swayosd-server") ]; }
      {
        command = [
          "systemctl"
          "--user"
          "restart"
          "snowy-shell.service"
        ];
      }
      {
        command = [
          "systemctl"
          "--user"
          "restart"
          "syncthingtray.service"
        ];
      }
    ];
  };
}
