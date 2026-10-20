{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    transmission_4
    flood-for-transmission
  ];
  services.transmission = {
    enable = true;
    package = pkgs.transmission_4;
    openPeerPorts = true;
    openFirewall = true;
    downloadDirPermissions = "770";
    webHome = pkgs.flood-for-transmission;
  };
}
