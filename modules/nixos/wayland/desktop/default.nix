{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.wayland;
in
  with lib; {
    options = {
      wayland = {
        enable = mkEnableOption "Enable wayland";
        sway = {
          enable = mkEnableOption "Enable swaywm";
          swayfx.enable = mkEnableOption "Enable swayfx";
        };
        hyprland.enable = mkEnableOption "Enable hyprland";
        gnome-extra.enable = mkEnableOption "Enable gnome stuff";
      };
    };
    config = mkIf cfg.enable {
      security.pam.services.swaylock.text = ''
        auth include login
      '';
      security.pam.services.gtklock.text = ''
        auth include login
      '';
      programs.dconf.enable = true;
      programs.hyprland = mkIf cfg.hyprland.enable {enable = true;};
      programs.sway = mkIf cfg.sway.enable {
        enable = true;
        package = mkIf cfg.sway.swayfx.enable pkgs.swayfx;
        wrapperFeatures = {
          gtk = true;
          base = true;
        };
      };
      services.gnome = mkIf cfg.gnome-extra.enable {
        gnome-settings-daemon.enable = true;
        gnome-keyring.enable = true;
        sushi.enable = true;
        tracker.enable = true;
        tracker-miners.enable = true;
      };
      programs.file-roller.enable = mkIf cfg.gnome-extra.enable true;
      systemd = mkIf config.os.security.polkit.enable {
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
    };
  }
