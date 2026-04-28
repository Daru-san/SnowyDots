{
  documentation.man.generateCaches = false;
  programs = {
    usbtop.enable = true;
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "foot";
    };
    git.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "-k 4 -K 7d";
        dates = "03:50";
      };
      flake = "/home/daru/snow/dots/";
    };
  };
}
