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
      swaync.enable = true;
    };
    programs = {
      waybar.enable = true;
      anyrun.enable = true;
      hyprlock.enable = true;
      wezterm.enable = false;
      foot.enable = true;
      crimson.enable = false;
    };
    home.packages = [
      pkgs.wl-clipboard-rs
      inputs.smitty.packages.${system}.smitty
    ];
  };
}
