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
    ./kitty
    ./wlsunset
    ./anyrun
    ./snowy-shell
    ./avizo
    ./swaync
  ];
  config = mkIf cfg.enable {
    services = {
      hypridle.enable = true;
      wlsunset.enable = true;
      avizo.enable = true;
      swaync.enable = true;
    };
    programs = {
      wpaperd.enable = true;
      anyrun.enable = true;
      kitty.enable = true;
      hyprlock.enable = true;
      snowy-shell.enable = true;
    };
    home.packages = [ pkgs.wl-clipboard-rs ];
  };
}
