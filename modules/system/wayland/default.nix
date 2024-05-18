{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.wayland;
in {
  options.wayland.enable = mkEnableOption "Enable wayland";
  config = mkIf cfg.enable {
    programs.hyprland.enable = true;
    security.pam.services.hyprlock = {};
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
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to ${config.networking.hostName}' -c ${cfg.compositor}";
          user = "daru";
        };
        default_session = initial_session;
      };
    };
    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
