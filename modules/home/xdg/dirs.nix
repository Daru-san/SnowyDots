{config, ...}: let
  hm = config.home.homeDirectory;
in rec {
  enable = true;

  # Automatically create directories
  createDirectories = true;

  # Default directories
  desktop = null;
  music = "${hm}/Music";
  pictures = "${hm}/Pictures";
  videos = "${hm}/Videos";
  download = "${hm}/Downloads";
  screenshots = "${pictures}/Screenshots";
  publicshare = null;
  templates = null;

  # Special directories
  extraConfig = rec {
    emu = "${hm}/Emulation";
    anime = "${videos}/Anime";
    projects = "${dev}/Projects";
    notes = "${hm}/Notes";
    walls = "${hm}/Wallpapers";
    dev = "${hm}/Development";
    secret = "${hm}/.secrets";
    repos = "${dev}/Repos";
  };
}
