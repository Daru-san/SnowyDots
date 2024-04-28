{
  pkgs,
  config,
  lib,
  ...
}:
lib.mkIf (config.wayland.compositor == "sway") {
  home.packages =
    (with pkgs; [swayws swayr swaytools])
    ++ [config.nur.repos.misterio.swayfader];
}
