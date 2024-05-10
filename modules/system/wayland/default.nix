{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkOption types mkIf mkMerge mkForce getExe;
  cfg = config.wayland;
in {
  options = {
    wayland = {
      enable = mkEnableOption "Enable wayland compositors";
      sway.enable = mkEnableOption "Enable sway";
      hyprland.enable = mkEnableOption "Enable hyprland";
      compositor = mkOption {
        type = with types; nullOr str;
        default = null;
      };
    };
  };
  config = mkIf cfg.enable (mkMerge [
    (mkIf cfg.sway.enable {
      programs.sway = {
        enable = true;
        extraPackages = [];
      };
      security.pam.services.gtklock.text = builtins.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
      wayland.compositor = mkForce "sway";
    })
    (mkIf cfg.hyprland.enable {
      programs.hyprland.enable = true;
      security.pam.services.hyprlock = {};
      wayland.compositor = mkForce "Hyprland";
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
          ExecStart = getExe pkgs.lxqt.lxqt-policykit;
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    }
  ]);
}
