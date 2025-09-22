{
  config,
  lib,
  pkgs,
  inputs,
  system,
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
    ./waycute
    ./wezterm
    ./foot
    ./swaync
    ./crimson
    ./wleave
  ];
  config = mkIf cfg.enable {
    wayland.windowManager.sway.enable = false;
    wayland.windowManager.hyprland.enable = true;
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      wlsunset.enable = true;
      swayosd.enable = true;
      flameshot.enable = true;
      swaync.enable = false;
    };
    programs = {
      waybar.enable = false;
      anyrun.enable = true;
      hyprlock.enable = true;
      wezterm.enable = false;
      foot.enable = true;
      crimson.enable = true;
      wleave.enable = true;
    };
    home.packages = [
      pkgs.wl-clipboard-rs
    ];
  };
}
