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
  options.wayland.enable = mkEnableOption "Enable wayland";
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
    wayland.windowManager.mango.enable = false;
    # programs.niri.enable = false;
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      awww.enable = false;
      wlsunset.enable = false;
      gammastep.enable = true;
      swayosd.enable = false;
      flameshot.enable = true;
      swaync.enable = false;
      hyprpolkitagent.enable = true;
    };
    programs = {
      waybar.enable = false;
      anyrun.enable = false;
      fuzzel.enable = true;
      hyprlock.enable = false;
      wezterm.enable = false;
      foot.enable = true;
      wleave.enable = true;
      noctalia.enable = true;
    };
    home.packages = with pkgs; [
      wl-clipboard-rs
    ];
  };
}
