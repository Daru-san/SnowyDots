{
  lib
}:
with lib;
mkIf config.wayland.windowManager.sway.enable {
  imports = [./sway.nix];
}
