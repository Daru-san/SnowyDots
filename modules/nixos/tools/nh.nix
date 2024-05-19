{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "-k 4 -K 7d";
      dates = "03:50";
    };
    flake = "/home/daru/snow/";
  };
}
