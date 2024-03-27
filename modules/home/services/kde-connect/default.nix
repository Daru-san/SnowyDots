{
  imports = [./kdeconnect-qt6.nix];
  services.kdeconnect-qt6 = {
    enable = true;
    indicator = true;
  };
}
