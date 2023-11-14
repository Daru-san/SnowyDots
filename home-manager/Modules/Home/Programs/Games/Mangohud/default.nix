{config, pkgs, ...}:{
  #Enable mangohud for viewing performance mertric
  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
      output_folder = ~/.mango;
    };
    enableSessionWide = true;
  };
}
