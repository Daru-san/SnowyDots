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
      {
        command = [
          (lib.getExe config.services.clipse.package)
          "--listen-shell"
        ];
      }
      {
        command = [
          (lib.getExe config.programs.ghostty.package)
          "-e"
          (lib.getExe config.programs.btop.package)
        ];
      }
      { command = [ (lib.getExe pkgs.xwayland-satellite) ]; }
      { command = [ (lib.getExe' config.services.swayosd.package "swayosd-server") ]; }
      { command = [ (lib.getExe pkgs.varia) ]; }
    ];
  };
}
