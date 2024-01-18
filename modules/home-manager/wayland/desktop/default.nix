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
    config.wayland = {
      enable = mkOption {
        type = with types; bool;
        default = true;
      };
      sway = {
        enable = mkOption {
          type = with types; bool;
          default = false;
        };
        swayfx.enable = mkOption {
          type = with types; bool;
          default = false;
        };
        hyprland.enable = mkOption {
          type = with types; bool;
          default = true;
        };
      };
    };
  };
  config = mkIf cfg.enable {
    imports = 
    (mkIf cfg.sway.enable [../../../../home/${config.home.username}/wayland/sway/default.nix])
    ++
    (mkIf cfg.hyprland.enable [ ../../../../home/${config.home.username}/wayland/hyprland/default.nix]);
  };
}
