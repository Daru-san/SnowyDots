{
  config
, pkgs
, ...
}: 
let
  hyprland = pkgs.fetchgit {
    url = "https://github.com/hyprwm/Hyprland";
    rev = "a6ccd36147109d5cb2981122595f06ae93999b55";
    sha256 = "+Z/JjrAfy0raiStSRzE3JfW20uDOs4GMt+4TrDz2S9A=";
  };
in
{

  home.packages = with pkgs; [
    swww
  ];

  theme.wallpaper.image = "${hyprland}/assets/wall0.png";

  # Shuffle throught the hyprland wallpapers from the repo
  programs.wpaperd = {
    enable = true;
    settings = {
      HDMI-A-1 = {
        path = "${hyprland}/assets/";
        sorting = "ascending";
        duration = "30m";
      };
    };
  };
}
