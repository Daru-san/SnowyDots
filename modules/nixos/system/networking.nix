{pkgs, ...}: {
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];
    networkmanager = {
      enable = true;
      dns = "none";
      wifi = {
        backend = "iwd";
        macAddress = "random";
        powersave = false;
      };
    };
    wireless.iwd = {
      enable = true;
      settings = {
        Settings = {
          AutoConnect = false;
          Hidden = true;
          AlwaysRandomizeAddress = true;
        };
      };
    };
  };
  environment.systemPackages = [pkgs.iw];
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", KERNEL=="wlan*" RUN+="${pkgs.iw}/bin/iw dev %k set power_save off"
  '';
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
