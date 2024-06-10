{
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway.config.startup = [
    {command = lib.getExe pkgs.kitty;}
    {command = lib.getExe pkgs.copyq;}
    {command = lib.getExe pkgs.autotiling-rs;}
    {command = lib.getExe pkgs.sway-assign-cgroups;}
    {
      command = "systemctl --user restart kanshi";
      always = true;
    }
  ];
}
