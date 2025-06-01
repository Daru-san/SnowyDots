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
  options.wayland.enable = mkEnableOption "Enable wayland using Niri";
  imports = [
    ./hypridle
    ./hyprlock
    ./wlsunset
    ./anyrun
    ./ghostty
    ./waybar
    ./flameshot
    ./snowy-shell
    ./waycute
  ];
  config = mkIf cfg.enable {
    wayland.windowManager.sway.enable = false;
    wayland.windowManager.hyprland.enable = true;
    programs.niri.enable = false;
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      wlsunset.enable = true;
      swayosd.enable = true;
      flameshot.enable = true;
    };
    programs = {
      waybar.enable = true;
      snowy-shell.enable = false;
      anyrun.enable = true;
      hyprlock.enable = true;
      ghostty.enable = true;
    };
    home.packages = [ pkgs.wl-clipboard-rs ];
  };
}
