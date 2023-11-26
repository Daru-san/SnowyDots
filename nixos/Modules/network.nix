{lib,...}:{
  # Networking configurations
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    #Custom dns nameservers
    nameservers = ["1.1.1.1" "1.0.0.1"];

    #Enable firewall
    firewall = {
      enable = true;

      #Configure TCP and UDP ports to fix KDE connect
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; }
      ];
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; }
      ];
    };
  };
  #Enable dhcp
  networking.useDHCP = lib.mkDefault true;
  #Bluetooth configurations
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      # DiscoverableTimout = 0;
    };
    input = {
    };
    network = {
      general = {
        DisableSecurity = true;
      };
    };
  };

  # SSH configurations
  services.openssh = {
     enable = true;
     # require public key authentication for better security
     settings.PasswordAuthentication = false;
     settings.KbdInteractiveAuthentication = false;
     #settings.PermitRootLogin = "yes";
  };
}
