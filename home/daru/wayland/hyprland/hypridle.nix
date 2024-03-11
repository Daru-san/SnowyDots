{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  hyprlock = "${getExe config.programs.bash.package} -c ${getExe config.prograsm.hyprlock.package}";
  beforeSleep = with pkgs;
    writeShellScriptBin "sleep" ''
      ${getExe' config.services.playerctld.package "playerctl"} pause
      ${hyprlock}
    '';
in {
  imports = [inputs.hypridle.homeManagerModules.default];
  services.hypridle = {
    enable = true;
    listeners = [
      {
        timeout = 1200;
        onTimeout = lock;
      }
      {
        timeout = 1800;
        onTimeout = "systemctl suspend";
      }
    ];
    lockCmd = hyprlock;
    beforeSleepCmd = "${with lib; getExe beforeSleep}";
  };
}
