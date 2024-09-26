{ pkgs, ... }:
{
  services = {
    psd = {
      enable = true;
      resyncTimer = "1hr";
    };
    playerctld.enable = true;
    easyeffects.enable = true;
    kdeconnect.enable = true;
    udiskie.enable = true;
    gnome-keyring = {
      enable = true;
      components = [
        "secrets"
        "ssh"
      ];
    };
    syncthing = {
      enable = true;
      tray = {
        enable = true;
        package = pkgs.syncthingtray;
        command = "syncthingtray --wait";
      };
    };
  };
}
