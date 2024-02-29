{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.connect;
in
  with lib; {
    imports = [./kdeconnect-qt6.nix];
    options = {
      connect = {
        kdeconnect.enable = mkOption {
          default = false;
          type = with types; bool;
          example = true;
        };
        syncthing.enable = mkOption {
          default = false;
          type = with types; bool;
          example = true;
        };
      };
    };
    config = {
      services.kdeconnect-qt6 = mkIf cfg.kdeconnect.enable {
        enable = true;
        # package = with pkgs; kdePackages.kdeconnect-kde;
        indicator = true;
      };
      services.syncthing = mkIf cfg.syncthing.enable {
        enable = true;
        tray = {
          enable = true;
          package = pkgs.syncthingtray;
        };
      };
    };
  }
