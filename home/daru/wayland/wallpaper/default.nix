{
  config
, pkgs
, ...
}: 
let
  walls = pkgs.fetchgit {
    url = "https://github.com/D3Ext/aesthetic-wallpapers";
    rev = "060c580dcc11afea2f77f9073bd8710920e176d8";
    sha256 = "5MnW630EwjKOeOCIAJdSFW0fcSSY4xmfuW/w7WyIovI=";
  };
in
{

  home.packages = with pkgs; [
    swww
  ];

  theme.wallpaper.image = "${walls}/images/minimal_c.png";

  # Shuffle throught the hyprland wallpapers from the repo
  programs.wpaperd = {
    enable = true;
    settings = {
      HDMI-A-1 = {
        path = "${config.theme.wallpaper.image}";
        apply-shadow = false;
      };
    };
  };
}
