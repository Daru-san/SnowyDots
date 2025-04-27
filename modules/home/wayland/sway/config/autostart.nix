{
  pkgs,
  lib,
  config,
  ...
}:
{
  wayland.windowManager.sway.config.startup = [
    { command = lib.getExe pkgs.autotiling-rs; }
    { command = lib.getExe pkgs.sway-assign-cgroups; }
    { command = lib.getExe pkgs.kitty + " --app-id btop --hold " + lib.getExe pkgs.btop; }
    { command = lib.getExe config.programs.clipse.package + "--listen-shell"; }
    { command = lib.getExe' pkgs.perl540Packages.Apppapersway "papersway"; }
  ];
}
