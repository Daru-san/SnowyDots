pkgs: {
  freetube = {
    name = "FreeTube";
    genericName = "YouTube";
    comment = "Feature rich YouTube client, now running on wayland!";
    exec = "${pkgs.freetube}/bin/freetube %U --enable-features=UseOzonePlatform --ozone-platform=wayland";
    icon = "freetube";
    type = "Application";
    settings = {Keywords = "video;youtube";};
  };
  bridge-core = {
    name = "Bridge";
    comment = "Make your own Minecraft mods with ease";
    exec = "${pkgs.bridge-core}/bin/bridge-core %U";
    type = "Application";
    icon = "minecraft";
    settings = {Keywords = "minecraft";};
  };
  musikcube = {
    name = "musikcube";
    comment = "Terminal music player";
    exec = "kitty --session musikcube.conf";
    type = "Application";
    icon = "musikcube";
    settings = {Keywords = "music";};
  };
}
