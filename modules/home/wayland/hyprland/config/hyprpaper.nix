{config, ...}: {
  services.hyprpaper = {
    settings = {
      ipc = "on";
      splash = false;
      preload = [config.wallpaperImage];
      wallpaper = ["HDMI-A-2,${config.wallpaperImage}"];
    };
  };
}
