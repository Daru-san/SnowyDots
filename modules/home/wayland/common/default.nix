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
    ./waybar
    ./swaync
  ];
  config = mkIf cfg.enable {
    wayland.windowManager.sway.enable = true;
    services = {
      kanshi.enable = true;
      hypridle.enable = true;
      swayosd.enable = true;
      wlsunset.enable = true;
      swaync.enable = true;
    };
    programs = {
      anyrun.enable = true;
      ags.enable = false;
      wlogout.enable = true;
      hyprlock.enable = true;
      waybar.enable = true;
    };
    home.packages = [pkgs.wl-clipboard-rs];
  };
}
