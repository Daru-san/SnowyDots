{
  config
, pkgs
, ...
}: 
let
  hyprland = pkgs.fetchgit {
    url = "https://github.com/hyprwm/Hyprland";
    rev = "a6ccd36147109d5cb2981122595f06ae93999b55";
    sha256 = "0xksvshxc48ymp5xzqav35p9kxlfdwbpb92ciq3vlcn3qfflhw3s";
  };
in
{

  home.packages = with pkgs; [
    swww
  ];

  # themes.wallpaper.image = "${hyprland}/assets/wall2.png";

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
  }
}
