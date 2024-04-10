{
  lib,
  config,
  ...
}: let
  cfg = config.wayland;
in
  with lib; {
    options.wayland = {
      enable = mkEnableOption "Enable wayland";
      compositor = mkOption {
        type = with types; nullOr (enum ["hyprland" "sway"]);
        default = null;
        example = "sway";
      };
    };
    config = mkIf cfg.enable {
      wayland.windowManager.hyprland.enable = mkIf (cfg.compositor == "hyprland") true;
      wayland.windowManager.sway.enable = mkIf (cfg.compositor == "sway") true;
    };
  }
