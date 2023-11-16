{pkgs, ...}:{
  programs.translate-shell = {
    enable = true;
    settings = {
      hl = "en";
      view = true;
      engine = "bing";
      verbose = true;
    };
  };
}
