{
  pkgs,
  lib,
  config,
  ...
}:
let
cfg = config.android;  
in 
with lib;
{
  options = {
    android = {
      adb.enable = mkOption {
        default = false;
        type = with types; bool;
      };
      mtp = {
        gvfs.enable = mkOption {
          default = false;
          type = with types; bool;
        };
        jmtpfs.enable = mkOption {
          default = false;
          type = with types; bool;
        };
      };
      waydroid.enable = mkOption {
        default = false;
        type = with types; bool;
      };
    };
  };
  config = {
    programs.adb.enable = mkIf cfg.adb.enable true;

    services.gvfs.enable = mkIf cfg.mtp.gvfs true;

    environment.systemPackages = with pkgs; mkIf cfg.mtp.jmptfs.enable [
      jmtpfs
    ];
    virtualisation.waydroid.enable = mkIf cfg.waydroid.enable true;
  };
}
