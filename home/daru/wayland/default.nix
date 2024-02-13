{lib, ...}:
with lib; {
  imports = [
    ./waybar/waybar.nix
    ./wallpaper/default.nix
    ./sway/default.nix
    ./hyprland/default.nix
  ];

  wayland = {
    compositor = "hyprland";
    ags.enable = true;
  };
}
