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
  options.wayland.enable = mkEnableOption "Enable wayland using niri";
  imports = [
    ./hypridle
    ./hyprlock
    ./wlsunset
    ./anyrun
    ./snowy-shell
    ./swaync
    ./ghostty
  ];
  config = mkIf cfg.enable {
    services = {
      hypridle.enable = true;
      hyprpaper.enable = true;
      wlsunset.enable = true;
      swaync.enable = true;
      swayosd.enable = true;
    };
    programs = {
      anyrun.enable = true;
      hyprlock.enable = true;
      foot.enable = true;
      ghostty.enable = true;
      snowy-shell.enable = true;
    };
    home.packages = [ pkgs.wl-clipboard-rs ];
  };
}
