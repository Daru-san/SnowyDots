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
          (lib.getExe pkgs.nvtopPackages.intel)
          "-a"
          "nvtop"
        ];
      }
      {
        command = [
          (lib.getExe config.programs.foot.package)
          "-e"
          "btop"
          "-a"
          "btop"
        ];
      }
      { command = [ (lib.getExe pkgs.xwayland-satellite) ]; }
    ];
  };
}
