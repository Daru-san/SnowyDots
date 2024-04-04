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
        default = "hyprland";
        example = "sway";
      };
    };
    config = mkIf cfg.enable {
      wayland.windowManager.hyprland.enable = mkIf (cfg == "hyprland") true;
      wayland.windowManager.sway.enable = mkIf (cfg == "sway") true;
    };
  }
