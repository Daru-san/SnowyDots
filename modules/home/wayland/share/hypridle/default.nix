{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.wayland.compositor;
  lockscreen = pkgs.writeShellScriptBin "lock" ''
    ${mkIf (cfg == "hyprland") (getExe config.programs.hyprlock.package)}
    ${mkIf (cfg == "sway") (getExe pkgs.gtklock)}
  '';
  beforeSleepCmd = getExe (pkgs.writeShellScriptBin "sleep" ''
    ${getExe' config.services.playerctld.package "playerctl"} pause
    ${getExe lockscreen}
  '');
in {
  imports = with inputs.hypridle.homeManagerModules; [default];
  home.packages = [lockscreen];
  services.hypridle = {
    enable = true;
    package = mkIf (home.stateVersion != "24.05") pkgs.hypridle;
    listeners = [
      {
        timeout = 1200;
        onTimeout = getExe lockscreen;
      }
      {
        timeout = 1800;
        onTimeout = "systemctl suspend";
      }
    ];
    lockCmd = getExe lockscreen;
    inherit beforeSleepCmd;
  };
}
