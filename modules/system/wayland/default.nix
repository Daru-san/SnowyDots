{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.wayland;
in
  with lib; {
    options = {
      wayland = {
        sway.enable = mkEnableOption "Enable sway";
        hyprland.enable = mkEnableOption "Enable hyprland";
        compositor = mkOption {
          type = with types; nullOr str;
          default = "";
        };
      };
    };
    config = mkMerge [
      (mkIf cfg.sway.enable {
        programs.sway.enable = true;
        wayland.compositor = "sway";
      })
      (mkIf cfg.hyprland.enable {
        programs.hyprland.enable = true;
        wayland.compositor = "hyprland";
      })
      {
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
    ];
  }
