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
      adb.enable = mkEnableOption "Enable adb";
      mtp = {
        gvfs.enable = mkEnableOption "Enable gvfs for automounting android devices using mtp";
        jmtpfs.enable = mkEnableOption "Enable jmtpfs for manual mounting android devices using mtp";
      };
      waydroid.enable = mkEnableOption "Enable waydroid";
    };
  };
  config = {
    programs.adb.enable = mkIf cfg.adb.enable true;

    services.gvfs.enable = mkIf cfg.mtp.gvfs.enable true;

    environment.systemPackages = with pkgs; mkIf cfg.mtp.jmtpfs.enable [
      jmtpfs
    ];
    virtualisation.waydroid.enable = mkIf cfg.waydroid.enable true;
  };
}
