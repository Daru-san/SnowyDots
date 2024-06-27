{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) getExe getExe';
  hyprlock = getExe config.programs.hyprlock.package;
  lock_cmd = "pidof hyprlock || ${hyprlock}";
  pausemusic = getExe (pkgs.writeShellScriptBin "music-pause" ''
    ${getExe' config.services.playerctld.package "playerctl"} pause
  '');
in {
  services.hypridle = {
    settings = {
      general = {
        before_sleep_cmd = "${pausemusic} && ${hyprlock}";
        inherit lock_cmd;
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 3000;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
