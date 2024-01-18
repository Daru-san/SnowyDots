{pkgs, config, lib,...}:
with lib;
mkIf (wayland.compostor == sway) {
  home.packages = with pkgs; [
    swayws
    swayr
    swaytools
    swaysettings
  ] ++ [
    config.nur.repos.misterio.swayfader
  ];
}
