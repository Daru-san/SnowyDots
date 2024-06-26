{pkgs, ...}: {
  services.kdeconnect = {
    indicator = true;
    package = pkgs.valent;
  };
}
