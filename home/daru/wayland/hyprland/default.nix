{
  lib
}:
with lib;
mkIf config.wayland.windowManager.hyprland.enable {
  imports = [./hyprland.nix];
}
