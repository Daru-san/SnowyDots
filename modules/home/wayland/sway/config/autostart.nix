{
  pkgs,
  lib,
  config,
  ...
}:
{
  wayland.windowManager.sway.config.startup = [
    { command = lib.getExe pkgs.copyq; }
    { command = lib.getExe pkgs.autotiling-rs; }
    { command = lib.getExe pkgs.sway-assign-cgroups; }
    {
      command = "sleep 3 && " + lib.getExe pkgs.swww + " img ${config.wallpaperImage}";
      always = true;
    }
    { command = lib.getExe pkgs.kitty + " --app-id btop --hold " + lib.getExe pkgs.btop; }
  ];
}
