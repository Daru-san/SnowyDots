# Settings folders that will be present everytime the config is built
{ config, pkgs, ... }: {
  xdg.userDirs = {
    enable = true;

    # Make it auto createnerate the directories if they don't exist
    createDirectories = true;

    # Default directories
    desktop = "${config.home.homeDirectory}/Desktop";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
    download = "${config.home.homeDirectory}/Downloads";
    templates = "${config.home.homeDirectory}/Templates";
    # Special directories
    extraConfig = {
      Emulation = "${config.home.homeDirectory}/Emulation";
      Anime = "${config.home.homeDirectory}/Anime";
      Projects = "${config.home.homeDirectory}/Projects";
      Scripts = "${config.home.homeDirectory}/Scripts";
      Notes = "${config.home.homeDirectory}/Notes";
      Wallpapers = "${config.home.homeDirectory}/Wallpapers";
    };
  };
  xdg.portal = {
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
    xdgOpenUsePortal = true;
  };
}
