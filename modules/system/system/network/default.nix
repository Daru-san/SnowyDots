{
  config,
  lib,
  ...
}: let
  cfg = config.os.networking;
in
  with lib; {
    options = {
      os.networking = {
        wifi = mkEnableOption "Enable wifi";
        bluetooth = mkEnableOption "Enable bluetooth";
      };
    };
    config = mkMerge [
      (mkIf cfg.wifi {
        networking = {
          nameservers = ["1.1.1.1" "1.0.0.1"];
          dhcpcd.extraConfig = "nohook resolv.conf";
          networkmanager = {
            enable = true;
            wifi.backend = "iwd";
            dns = "none";
            extraConfig = ''
              [device]
              wifi.iwd.autoconnect=false
            '';
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
      (mkIf cfg.bluetooth {
        services.blueman.enable = true;
        hardware.bluetooth = {
          enable = true;
          powerOnBoot = false;
          network.general.DisableSecurity = true;
        };
      })
    ];
  }
