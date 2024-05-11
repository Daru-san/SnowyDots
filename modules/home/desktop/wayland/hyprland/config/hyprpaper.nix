{config, ...}: {
  services.hyprpaper = {
    ipc = "on";
    splash = false;
    preload = [config.wallpaperImage];
    wallpaper = ["HDMI-A-1,${config.wallpaperImage}"];
  };
}
