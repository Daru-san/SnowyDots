{
  lib,
  ...
}:
with lib;
{
  imports = [
    ./waybar/waybar.nix
    ./wallpaper/default.nix
  ];
  wayland.compositor = "hyprland";
}
