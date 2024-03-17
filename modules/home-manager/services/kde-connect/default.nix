{
  imports = [./kdeconnect-qt6.nix];
  programs.kdeconnect-qt6 = {
    enable = true;
    indicator = true;
  };
}
