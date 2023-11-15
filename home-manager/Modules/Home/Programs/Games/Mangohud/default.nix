{config, pkgs, ...}:{
  #Enable mangohud for viewing performance mertric
  programs.mangohud = {
    enable = true;
    package = pkgs.unstable.mangohud;
    settings = {
      full = true;
      output_folder = "${config.home.homeDirectory}/.mango";
    };
    enableSessionWide = true;
  };
}
