{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.xsession;
in {
  services.redshift = mkIf cfg.enable {
    enable = true;
    latitude = "25.99";
    longitude = "28.18";
  };
}
