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
      { command = [ (lib.getExe config.programs.kitty.package + " --hold btop") ]; }
      { command = [ (lib.getExe pkgs.xwayland-satellite) ]; }
      { command = [ (lib.getExe' config.services.swayosd.package "swayosd-server") ]; }
      { command = [ (lib.getExe config.programs.wpaperd.package) ]; }
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
