{pkgs, ...}: {
  services.kdeconnect = {
    package = pkgs.valent;
  };
}
