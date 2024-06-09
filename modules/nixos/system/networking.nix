{
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];
    dhcpcd.extraConfig = "nohook resolv.conf";
  };
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
      wifi.macAddress = "random";
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
