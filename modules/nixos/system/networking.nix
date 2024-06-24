{pkgs, ...}: {
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];
    networkmanager = {
      enable = true;
      dns = "none";
      wifi = {
        macAddress = "random";
        powersave = false;
      };
    };
  };
  environment.systemPackages = [pkgs.networkmanagerapplet];
  networking.firewall = {
    enable = true;
  };
}
