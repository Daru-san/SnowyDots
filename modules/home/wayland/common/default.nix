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
    ./waybar
    ./flameshot
    ./wezterm
    ./foot
    ./swaync
    ./wleave
    ./fuzzel
    ./noctalia
    ./scarlet
    ./gammastep
  ];
  config = mkIf cfg.enable {
    wayland.windowManager.sway.enable = false;
    wayland.windowManager.hyprland.enable = true;
    # programs.niri.enable = false;
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      awww.enable = true;
      wlsunset.enable = false;
      gammastep = true;
      swayosd.enable = false;
      flameshot.enable = true;
      swaync.enable = false;
    };
    programs = {
      waybar.enable = false;
      anyrun.enable = false;
      fuzzel.enable = true;
      hyprlock.enable = false;
      wezterm.enable = false;
      foot.enable = true;
      wleave.enable = true;
    };
    home.packages = with pkgs; [
      wl-clipboard-rs
    ];
  };
}
