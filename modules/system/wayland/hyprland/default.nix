{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
  mkIf programs.hyprland.enable {
    programs = {
      dconf.enable = true;
      file-roller.enable = true;
    };
    services.gnome = {
      gnome-settings-daemon.enable = true;
      gnome-keyring.enable = true;
      sushi.enable = true;
      tracker.enable = true;
      tracker-miners.enable = true;
    };
    services.greetd = {
      package = pkgs.greetd;
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to ${config.networking.hostName}' -c Hyprland";
          user = "daru";
        };
        default_session = initial_session;
      };
    };
    systemd = {
      user.services.lxpolkit = {
        description = "lxpolkit";
        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${getExe' pkgs.lxde.lxsession "lxpolkit"}";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  }