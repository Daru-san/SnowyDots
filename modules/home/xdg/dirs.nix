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
    XDG_MISC_DIR = "${hm}/Misc";
    XDG_REPO_DIR = "${XDG_DEV_DIR}/Repos";
    XDG_PROJECTS_DIR = "${XDG_DEV_DIR}/Projects";
    XDG_NOTES_DIR = "${hm}/Notes";
    XDG_DEV_DIR = "${hm}/Development";
    XDG_SECRET_DIR = "${hm}/.secrets";
  };
}
