{
  imports = [./wallpaper ./sway ./hyprland];
  wayland = {
    compositor = "hyprland";
    ags.enable = true;
  };
}
