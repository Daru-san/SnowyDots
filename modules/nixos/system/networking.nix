{
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];
    dhcpcd.enable = false;
  };
  networking = {
    wireless.iwd = {
      enable = true;
      settings = {
        General = {
          EnableNetworkConfiguration = true;
        };
        Network = {
          RoutePriorityOffset = 300;
          EnableIPv6 = false;
        };
        Settings = {
          AutoConnect = true;
          Hidden = true;
          AlwaysRandomizeAddress = true;
        };
      };
    };
  };

  networking.firewall = {
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
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };
}
