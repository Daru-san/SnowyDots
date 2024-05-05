{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) getExe getExe' mkIf;
  cfg = config.wayland;
  hyprlock = getExe config.programs.hyprlock.package;
  pausemusic = getExe (pkgs.writeShellScriptBin "sleep" ''
    ${getExe' config.services.playerctld.package "playerctl"} pause
  '');
in {
  services.hypridle = mkIf cfg.enable {
    general = {
      before_sleep_cmd = "${pausemusic} && loginctl lock-session";
      lock_cmd = ''pidof hyprlock || ${hyprlock}'';
      after_sleep_cmd = "hyprctl dispatch dpms on";
    };
    listeners = [
      {
        timeout = 300;
        on-timeout = "loginctl lock-session";
      }
      {
        timeout = 600;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
      }
      {
        timeout = 1200;
        on-timeout = "systemctl suspend";
      }
    ];
  };
}
