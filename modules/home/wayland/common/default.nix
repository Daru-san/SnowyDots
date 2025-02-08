{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.wayland;
in
{
  options.wayland.enable = mkEnableOption "Enable wayland using Hyprland";
  imports = [
    ./hypridle
    ./hyprlock
    ./wlsunset
    ./anyrun
    ./ghostty
    ./waybar
    ./snowy-shell
  ];
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.enable = true;
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      wlsunset.enable = true;
      swayosd.enable = true;
    };
    programs = {
      waybar.enable = false;
      snowy-shell.enable = true;
      anyrun.enable = true;
      hyprlock.enable = true;
      ghostty.enable = true;
    };
    home.packages = [ pkgs.wl-clipboard-rs ];
  };
}
