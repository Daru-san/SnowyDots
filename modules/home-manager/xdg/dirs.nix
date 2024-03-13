{config, ...}: let
  hm = "${config.home.homeDirectory}";
in {
  xdg.userDirs = {
    enable = true;

    # Automatically create directories
    createDirectories = true;

    # Default directories
    desktop = "${hm}/Desktop";
    music = "${hm}/Music";
    pictures = "${hm}/Pictures";
    videos = "${hm}/Videos";
    download = "${hm}/Downloads";

    # Special directories
    extraConfig = {
      emu = "${hm}/Emulation";
      anime = "${hm}/Anime";
      projects = "${hm}/Projects";
      scripts = "${hm}/Scripts";
      notes = "${hm}/Notes";
      walls = "${hm}/Wallpapers";
      dev = "${hm}/Development";
      secret = "${hm}/Secret";
      repos = "${hm}/Repos";
    };
  };
}
