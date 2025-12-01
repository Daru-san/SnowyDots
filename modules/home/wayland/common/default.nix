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
    # ./waycute
    ./wezterm
    ./foot
    ./swaync
    ./crimson
    ./wleave
    ./hyprpanel
    ./dms
  ];
  config = mkIf cfg.enable {
    wayland.windowManager.sway.enable = false;
    wayland.windowManager.hyprland.enable = false;
    programs.niri.enable = true;
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      wlsunset.enable = true;
      swayosd.enable = false;
      flameshot.enable = true;
      swaync.enable = false;
    };
    programs = {
      waybar.enable = false;
      anyrun.enable = true;
      hyprlock.enable = true;
      wezterm.enable = false;
      foot.enable = true;
      crimson.enable = false;
      wleave.enable = true;
      hyprpanel.enable = false;
      dankMaterialShell.enable = true;
    };
  };
}
