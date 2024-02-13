{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
  mkIf (config.wayland.compositor == "sway") {
    home.packages = with pkgs;
      [swayws swayr swaytools swaysettings]
      ++ [config.nur.repos.misterio.swayfader];
  }
