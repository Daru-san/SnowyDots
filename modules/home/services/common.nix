{ pkgs, ... }:
{
  services = {
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
      extraOptions = [
        "--no-default-folder"
      ];
      tray = {
        enable = true;
        package = pkgs.syncthingtray;
        command = "syncthingtray --wait";
      };
    };
  };
}
