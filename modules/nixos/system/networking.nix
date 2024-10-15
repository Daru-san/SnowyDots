{ pkgs, ... }:
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
      settings.wifi."iwd.autoconnect" = false;
    };
  };
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    iw
    wirelesstools
  ];
  networking.firewall = {
    enable = true;
  };
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
