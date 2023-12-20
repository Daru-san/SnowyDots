{pkgs, config, ...}:{
  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      genericName = "Music Player";
      exec = "${config.programs.spicetify.spotifyPackage}/bin/spotify %U --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "${pkgs.spotify}/icons/spotify_icon.ico";
      type = "Application";
      catagories = [ "Music" ];
    };

    waypaper = {
      name = "Waypaper";
      genericName = "Wallpapers";
      exec = "${pkgs.waypaper}/bin/waypaper %U";
      icon = "${pkgs.papirus-icon-theme}/Papirus/16x16/apps/livewallpaper.svg";
      type = "Application";
      catagories = [ "Wallpapers" ];
    };
  };
}
