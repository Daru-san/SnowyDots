{
  pkgs,
  config,
  lib,
  ...
  }:
  let
    cfg = config.wayland;
  in 
  with lib;
  {
  options = {
    wayland = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };
      sway = {
        enable = mkOption {
          default = false;
          type = with types; bool;
        };
        swayfx.enable = mkOption {
          default = false;
          type = with types; bool;
        };
      };
      hyprland.enable = mkOption {
        default = false;
        type = with types; bool;
      };
      gnome-extra.enable = mkOption {
        default = false;
        type = with types; bool;
      };
    };
  };
  config = mkIf cfg.enable {
    
    security.pam.services.swaylock.text = ''
      auth include login
    '';
    programs.dconf.enable = true;
    programs.hyprland = mkIf cfg.hyprland.enable {
      enable = true;
    };
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
  };
}
