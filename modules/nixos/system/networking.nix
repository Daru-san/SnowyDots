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
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", KERNEL=="wlan*" RUN+="${pkgs.iw}/bin/iw dev %k set power_save off"
  '';
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
}
