{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkMerge;
  cfg = config.os.networking;
in {
  options = {
    os.networking = {
      wifi.enable = mkEnableOption "Enable wifi";
      bluetooth.enable = mkEnableOption "Enable bluetooth";
    };
  };
  config = mkMerge [
    (mkIf cfg.wifi.enable {
      networking = {
        nameservers = ["1.1.1.1" "1.0.0.1"];
        dhcpcd.extraConfig = "nohook resolv.conf";
        networkmanager = {
          enable = true;
          dns = "none";
          wifi = {
            macAddress = "random";
            backend = "iwd";
          };
        };
        wireless.iwd = {
          enable = true;
          settings = {
            Network = {
              EnableIPv6 = true;
              RoutePriorityOffset = 300;
            };
            Settings.AutoConnect = false;
          };
        };

        firewall = {
          enable = true;
          allowedUDPPorts = [51413];
          allowedUDPPortRanges = [
            {
              from = 1714;
              to = 1764;
            }
          ];
          allowedTCPPortRanges = [
            {
              from = 1714;
              to = 1764;
            }
          ];
        };
      };
    })
    (mkIf cfg.bluetooth.enable {
      services.blueman.enable = true;
      hardware.bluetooth.enable = true;
    })
  ];
}
