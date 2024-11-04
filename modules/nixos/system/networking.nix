{
  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    networkmanager = {
      enable = true;
      dns = "none";
      wifi = {
        powersave = false;
        backend = "iwd";
        macAddress = "random";
      };
      settings = {
        device = {
          "wifi.iwd.autoconnect" = true;
        };
      };
    };
  };
  networking.firewall = {
    enable = true;
  };
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        ControllerMode = "dual";
        FastConnectable = true;
      };
    };
  };
  services.blueman.enable = true;
}
