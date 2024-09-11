{
  pkgs,
  lib,
  config,
  ...
}:
{
  wayland.windowManager.sway.config.startup = [
    { command = "systemctl --user import-environment XDG_SESSION_TYPE XDG_CURRENT_DESKTOP"; }
    { command = lib.getExe pkgs.copyq; }
    { command = lib.getExe pkgs.autotiling-rs; }
    { command = lib.getExe pkgs.sway-assign-cgroups; }
    {
      command = "sleep 2 && " + lib.getExe pkgs.swww + " img ${config.wallpaperImage}";
      always = true;
    }
    { command = lib.getExe pkgs.kitty + " --app-id btop --hold " + lib.getExe pkgs.btop; }
  ];
}
