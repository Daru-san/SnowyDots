{
  pkgs,
  lib,
  config,
  ...
  }:
  let
    cfg = config.connect;
  in
  with lib;
{
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
    services.kdeconnect = mkIf cfg.kdeconnect.enable {
      enable = true;
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
