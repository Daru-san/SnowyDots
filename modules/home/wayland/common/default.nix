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
    ./fuzzel
    ./swaync
    ./swayosd
    ./waybar
    ./ags
    ./kitty
    ./wlogout
    ./wlsunset
  ];
  config = mkIf cfg.enable {
    wayland.windowManager.sway.enable = false;
    services = {
      kanshi.enable = true;
      hypridle.enable = true;
      swaync.enable = true;
      swayosd.enable = true;
      wlsunset.enable = true;
    };
    programs = {
      ags.enable = true;
      wlogout.enable = true;
      hyprlock.enable = true;
      fuzzel.enable = true;
      waybar.enable = true;
    };
    home.packages = [pkgs.wl-clipboard-rs];
  };
}
