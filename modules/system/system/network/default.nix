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
      wifi = {
        enable = mkEnableOption "Enable wifi";
        iwd.enable = mkEnableOption "Enable iwd";
      };
      bluetooth.enable = mkEnableOption "Enable bluetooth";
    };
  };
  config = mkMerge [
    (mkIf cfg.wifi.enable {
      networking = {
        nameservers = ["1.1.1.1" "1.0.0.1"];
        dhcpcd.extraConfig = "nohook resolv.conf";
        networkmanager = mkMerge [
          {enable = true;}
          (mkIf cfg.wifi.iwd.enable {
            enable = true;
            wifi.backend = "iwd";
            dns = "none";
            settings = {
              device = {
                "wifi.iwd.autoconnect" = false;
              };
            };
          })
        ];

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
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    })
  ];
}
