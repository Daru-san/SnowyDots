{...}:{
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
    };
  };

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
