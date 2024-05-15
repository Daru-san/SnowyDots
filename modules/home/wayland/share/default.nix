{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.wayland;
in {
  imports = [
    ./kanshi
    ./hypridle
    ./compositor
    ./swaync
    ./swayosd
    ./waybar
    ./kitty
    ./wlogout
    ./wlsunset
  ];
  config = lib.mkIf cfg.enable {
    services = {
      kanshi.enable = true;
      hypridle.enable = true;
      swaync.enable = true;
      swayosd.enable = true;
      wlsunset.enable = true;
    };
    programs = {
      wlogout.enable = true;
      waybar.enable = true;
    };
    home.packages = [pkgs.wl-clipboard-rs pkgs.clipse];
  };
}
