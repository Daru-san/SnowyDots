{pkgs, ...}: {
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];
    networkmanager = {
      enable = true;
      dns = "none";
      settings.wifi = {
        "iwd.autoconnect" = false;
      };
      wifi = {
        backend = "iwd";
        macAddress = "random";
        powersave = false;
      };
    };
  };
  environment.systemPackages = [pkgs.networkmanagerapplet];
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
