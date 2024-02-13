{ pkgs, lib, config, ... }:
let cfg = config.wayland.compositor;
in with lib; {
  options = {
    wayland.compositor = mkOption {
      type = with types; nullOr (enum [ "hyprland" "sway" ]);
      default = "hyprland";
      example = "sway";
    };
  };
  config = {
    wayland.windowManager.hyprland.enable = mkIf (cfg == "hyprland") true;
    wayland.windowManager.sway.enable = mkIf (cfg == "sway") true;
  };
}
