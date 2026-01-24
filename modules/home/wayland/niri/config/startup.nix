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
          (lib.getExe pkgs.hyprpolkitagent)
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
      {
        command = [
          (lib.getExe config.programs.anyrun.package)
          "daemon"
        ];
      }
      {
        command = [
          "niri"
          "msg"
          "output"
          "HDMI-A-2"
          "custom-mode"
          "1920x1080@70"
        ];
      }
    ];
  };
}
