{pkgs, ...}: {
  services.kdeconnect = {
    indicator = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };
}
