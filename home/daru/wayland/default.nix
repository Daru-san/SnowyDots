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
  wayland = {
    enable = true;
    compositor = "hyprland";
  };
}
# (mkIf wayland.windowManager.sway.enable {
#   imports = [./sway/default.nix];
# })
# ++
# (mkIf wayland.windowManager.hyprland.enable {
#   imports = [./hyprland/default.nix];
# })
