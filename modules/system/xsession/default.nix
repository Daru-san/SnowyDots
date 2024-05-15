{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) getExe mkIf;
  cfg = config.services.xserver;
in
  mkIf cfg.enable {
    services.xserver = {
      windowManager.i3.enable = true;
      desktopManager.xterm.enable = false;
      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          enable = true;
          greeters.slick.enable = true;
        };
      };
      layout = "us";
    };
    programs = {
      i3lock.enable = true;
      dconf.enable = true;
      file-roller.enable = true;
    };
    services.gnome = {
      gnome-keyring.enable = true;
      sushi.enable = true;
    };
    systemd.user.services.lxpolkit = {
      description = "lxpolkit";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = getExe pkgs.lxqt.lxqt-policykit;
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  }
