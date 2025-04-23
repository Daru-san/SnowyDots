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
    ./snowy-shell
    ./ashell
    ./clipse
  ];
  config = mkIf cfg.enable {
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      wlsunset.enable = true;
      swayosd.enable = true;
      clipse.enable = true;
    };
    programs = {
      waybar.enable = false;
      snowy-shell.enable = false;
      anyrun.enable = true;
      hyprlock.enable = true;
      ghostty.enable = true;
    };
    home.packages = [ pkgs.wl-clipboard-rs ];
  };
}
