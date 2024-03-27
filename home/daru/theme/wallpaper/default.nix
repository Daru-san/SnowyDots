{pkgs, ...}: {
  home.packages = with pkgs; [swww];
  wallpaperImage = ./wallpaper3-dark.png;
}
