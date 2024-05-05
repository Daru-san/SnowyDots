{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) getExe getExe' mkIf;
  cfg = config.wayland;
  lockscreen =
    if (cfg.compositor == "hyprland")
    then (getExe config.programs.hyprlock.package)
    else (getExe pkgs.gtklock);
  beforeSleepCmd = getExe (pkgs.writeShellScriptBin "sleep" ''
    ${getExe' config.services.playerctld.package "playerctl"} pause
    ${lockscreen}
  '');
in {
  services.hypridle = mkIf cfg.enable {
    listeners = [
      {
        timeout = 1200;
        onTimeout = lockscreen;
      }
      {
        timeout = 1800;
        onTimeout = "systemctl suspend";
      }
    ];
    lockCmd = lockscreen;
    inherit beforeSleepCmd;
  };
}
