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
    ./foot
    ./anyrun
    ./snowy-shell
    ./swaync
  ];
  config = mkIf cfg.enable {
    services = {
      hypridle.enable = true;
      wlsunset.enable = true;
      swaync.enable = true;
      swayosd.enable = true;
    };
    programs = {
      wpaperd.enable = true;
      anyrun.enable = true;
      hyprlock.enable = true;
      foot.enable = true;
      snowy-shell.enable = true;
    };
    home.packages = [ pkgs.wl-clipboard-rs ];
  };
}
