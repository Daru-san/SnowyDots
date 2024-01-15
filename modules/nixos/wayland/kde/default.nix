{config, lib, ...}:
let
  cfg = config.wayland.kde;
in
with lib;
{
  options.wayland.kde = {
    enable = mkOption {
      default = false;
      example = true;
      type = with types; bool;
    };
  };
  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
}
