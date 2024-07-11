{
  services.flatpak.enable = true;
  programs = {
    darling.enable = true;
    usbtop.enable = true;
    adb.enable = true;
    git.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "-k 4 -K 7d";
        dates = "03:50";
      };
      flake = "/home/daru/snow/";
    };
  };
}
