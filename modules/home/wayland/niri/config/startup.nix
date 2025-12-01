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
          (lib.getExe pkgs.copyq)
        ];
      }
      {
        command = [
          (lib.getExe config.programs.foot.package)
          "-e"
          "btop"
        ];
      }
      { command = [ (lib.getExe pkgs.xwayland-satellite) ]; }
    ];
  };
}
