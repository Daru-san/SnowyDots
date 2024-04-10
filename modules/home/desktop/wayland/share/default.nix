{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.wayland;
in {
  imports = [
    ./kanshi
    ./hypridle
    ./compositor
    ./swaync
    ./swayosd
    ./waybar
    ./wlogout
    ./wlsunset
  ];
  config = mkIf cfg.enable {
    services = {
      kanshi.enable = true;
      hypridle.enable = true;
      swaync.enable = true;
      swayosd.enable = true;
      wlsunset.enable = true;
      copyq.enable = false;
    };
    programs = {
      wlogout.enable = true;
      waybar.enable = true;
    };
    home.packages = [pkgs.unstable.wl-clipboard-rs];
  };
}
