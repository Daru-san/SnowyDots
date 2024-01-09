{pkgs, ...}:{
  programs = {
    translate-shell = {
      enable = true;
      settings = {
        hl = "en";
        view = true;
        show-original-dictionary = true;
        show-alternatives = true;
        verbose = true;
      };
    };
  };
}
