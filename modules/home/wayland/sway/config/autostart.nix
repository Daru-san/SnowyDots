{
  pkgs,
  lib,
  ...
}:
{
  wayland.windowManager.sway.config.startup = [
    { command = lib.getExe pkgs.foot + " -e " + lib.getExe pkgs.btop; }
    { command = lib.getExe pkgs.copyq; }
    {
      command = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
    }
  ];
}
