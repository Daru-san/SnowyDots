{pkgs, config, ...}:{
  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      genericName = "Music Player";
      comment = "Customized music player, stream all your favourite music, for free and wayland native!";
      exec = "spotify %U --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "spotify";
      type = "Application";
      settings = {
        Keywords = "music";
      };
    };
    waypaper = {
      name = "Waypaper";
      genericName = "Wallpaper Browser";
      comment = "Browse wallpapers and apply them whenever you want!";
      exec = "${pkgs.waypaper}/bin/waypaper %U";
      icon = "livewallpaper";
      type = "Application";
      settings = {
        Keywords = "wallpaper";
      };
    };
    logseq = {
      name = "Logseq";
      exec = "${pkgs.logseq}/bin/logseq %U --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "logseq";
      type = "Application";
    };
    freetube = {
      name = "FreeTube";
      genericName = "YouTube";
      comment = "Feature rich YouTube client, now running on wayland!";
      exec = "${pkgs.freetube}/bin/freetube %U --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "freetube";
      type = "Application";
      settings = {
        Keywords = "video;youtube";
      };
    };
    cmus = {
      name = "Console Music";
      genericName = "Music Player";
      comment = "Play music in your terminal";
      exec = "bash -c cmus";
      terminal = true;
      icon = "rhythmbox";
      type = "Application";
      settings = {
        Keywords = "music";
      };
    };
    bridge-core = {
      name = "Bridge";
      comment = "Make your own Minecraft mods with ease";
      exec = "${pkgs.bridge-core}/bin/bridge-core";
      type = "Application";
      icon = "minecraft";
      settings = {
        Keywords = "minecraft";
      };
    };
  };
}
