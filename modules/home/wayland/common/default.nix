{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.wayland;
in {
  options.wayland.enable = mkEnableOption "Enable wayland using Hyprland";
  imports = [
    ./kanshi
    ./hypridle
    ./hyprlock
    ./swayosd
    ./ags
    ./kitty
    ./wlogout
    ./wlsunset
    ./anyrun
  ];
  config = mkIf cfg.enable {
    # wayland.windowManager.sway.enable = true;
    services = {
      kanshi.enable = true;
      hypridle.enable = true;
      swayosd.enable = true;
      wlsunset.enable = true;
    };
    programs = {
      anyrun.enable = true;
      ags.enable = true;
      wlogout.enable = true;
      hyprlock.enable = true;
    };
    home.packages = [pkgs.wl-clipboard-rs];
  };
}
