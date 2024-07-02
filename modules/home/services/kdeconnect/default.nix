{pkgs, ...}: {
  services.kdeconnect = {
    package = pkgs.valent.override {
      stdenv = pkgs.clangStdenv;
    };
  };
}
