{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  # Enable the desktop environment.
  services.xserver = {
    enable = true;
    windowManager.bspwm.enable = true;
    displayManager = {
      defaultSession = "none+bspwm";
      lightdm = {
        enable = true;
        greeters.slick.enable = true;
      };
    };
    # Configure keymap in X11
    layout = "us";
    xkbVariant = "euro";
  };
  programs = {
    dconf.enable = true;
    file-roller.enable = true;
  };
  services.gnome = {
    gnome-keyring.enable = true;
    sushi.enable = true;
  };
  services.greetd = {
    package = pkgs.greetd;
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to ${config.networking.hostName}' -c bspwm";
        user = "daru";
      };
      default_session = initial_session;
    };
  };
  systemd.user.services.lxpolkit = {
    description = "lxpolkit";
    wantedBy = ["graphical-session.target"];
    wants = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = getExe' pkgs.lxqt.lxqt-policykit "lxqt-policykit-agent";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
