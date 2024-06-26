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
    programs = {
      dconf.enable = true;
      hyprlock.enable = true;
      file-roller.enable = true;
    };
    services.greetd = {
      package = pkgs.greetd;
      enable = true;
      settings = rec {
        initial_session = {
          command = let
            flags = lib.cli.toGNUCommandLineShell {} {
              t = "";
              window-padding = 1;
              g = "Hello, Daru";
              c = "Hyprland";
            };
          in "${pkgs.greetd.tuigreet}/bin/tuigreet ${flags}";
          user = "daru";
        };
        default_session = initial_session;
      };
    };
    systemd = {
      user.services.polkit-gnome = {
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
