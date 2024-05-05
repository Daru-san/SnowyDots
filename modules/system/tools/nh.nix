{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "all -K 3d -k 3";
      dates = "03:50";
    };
    flake = "/home/daru/snow/";
  };
}
