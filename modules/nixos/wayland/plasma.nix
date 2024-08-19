{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.wayland.plasma;
in {
  options.wayland.plasma.enable = mkEnableOption "Plasma";
  config = mkIf cfg.enable {
    xdg.portal.enable = true;
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
