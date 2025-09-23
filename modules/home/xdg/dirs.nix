{ config, ... }:
let
  hm = config.home.homeDirectory;
in
rec {
  enable = true;
  createDirectories = true;

  desktop = null;
  music = "${hm}/Cabin/Media/Music";
  pictures = "${hm}/Cabin/Media/Pictures";
  videos = "${hm}/Cabin/Media/Videos";
  download = "${hm}/Downloads";
  publicShare = "${hm}/Share";
  templates = null;

  extraConfig = rec {
    XDG_SCREENSHOTS_DIR = "${pictures}/Screenshots";
    XDG_WALLPAPER_DIR = "${pictures}/Wallpapers";
    XDG_SECRET_DIR = "${hm}/Cabin/.secrets";
  };
}
