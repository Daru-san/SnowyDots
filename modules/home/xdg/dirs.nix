{ config, ... }:
let
  hm = config.home.homeDirectory;
in
rec {
  enable = true;
  createDirectories = true;

  desktop = null;
  music = "${hm}/Music";
  pictures = "${hm}/Pictures";
  videos = "${hm}/Videos";
  download = "${hm}/Downloads";
  publicShare = "${hm}/Share";
  templates = null;

  extraConfig = rec {
    XDG_SCREENSHOTS_DIR = "${pictures}/Screenshots";
    XDG_WALLPAPER_DIR = "${hm}/Wallpapers";
    XDG_SECRET_DIR = "${hm}/.secrets";
  };
}
