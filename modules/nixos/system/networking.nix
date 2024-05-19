{
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];
    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "none";
  };
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        macAddress = "random";
        backend = "iwd";
      };
    };
    wireless.iwd = {
      enable = true;
      settings.Settings.AutoConnect = false;
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
    settings.Experimental = true;
  };
}
