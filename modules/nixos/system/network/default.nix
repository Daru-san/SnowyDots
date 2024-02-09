{
  lib,
  config,
  ...
}:
let
cfg = config.os.networking;  
in 
with lib;
{
  options.os.networking = {
    enable = mkEnableOption "Enable networking";
    wifi.enable = mkEnableOption "Enable wifi connection";
    bluetooth.enable = mkEnableOption "Enable bluetooth connection";
  };

  config = mkIf cfg.enable {

    networking = mkIf cfg.wifi.enable {

      nameservers = ["1.1.1.1" "1.0.0.1"];
      dhcpcd.extraConfig = "nohook resolv.conf";

      networkmanager = {
        enable = true;
        wifi.backend = "iwd";
        dns = "none";
      };

      firewall = {
        enable = true;

        allowedUDPPortRanges = [
          { from = 1714; to = 1764; }
        ];
        allowedTCPPortRanges = [
          { from = 1714; to = 1764; }
        ];
      };
    };

    services.blueman.enable =  mkIf cfg.bluetooth.enable true;
    hardware.bluetooth = mkIf cfg.bluetooth.enable {
      enable = true;
      powerOnBoot = false;
      network.general.DisableSecurity = true;
    };
  };
}
