{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.wayland;
in
with lib;
{
  options = {
    wayland = {
      enable = mkEnableOption "wayland configuration";
      compositor = mkOption {
        type = with types; nullOr (enum [ "hyprland" "sway" ]);
        default = "hyprland";
        example = "sway";
      };
    };
  };
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.enable = mkIf (cfg.wayland.compositor == "hyprland") true;
    wayland.windowManager.sway.enable = mkIf (cfg.wayland.compositor == "sway") true;
  };
}
