{ config, pkgs, ... }:
let
  walls = pkgs.fetchgit {
    url = "https://github.com/D3Ext/aesthetic-wallpapers";
    rev = "060c580dcc11afea2f77f9073bd8710920e176d8";
    sha256 = "5MnW630EwjKOeOCIAJdSFW0fcSSY4xmfuW/w7WyIovI=";
  };
  cfg = config.theme.wallpaper;
in {

  home.packages = with pkgs; [
    swww
    (writeShellScriptBin "swww-switch" ''
      image=$( find "${cfg.path}" -type f -print0 | shuf -z -n 1 )

      notify-send "swww-switch" "Switching wallpaper"

      swww img $image
    '')
  ];

  theme.wallpaper = {
    image = "${walls}/images/minimal_c.png";
    path = "${walls}/images";
  };
  home.file."Wallpapers/aesthetic".source = "${walls}/images";
}
