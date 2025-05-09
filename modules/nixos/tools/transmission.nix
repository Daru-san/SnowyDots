{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    transmission-qt
    flood-for-transmission
  ];
  services.transmission = {
    enable = true;
    openPeerPorts = true;
    openFirewall = true;
    downloadDirPermissions = "770";
    webHome = "pkgs.flood-for-transmission";
  };
}
