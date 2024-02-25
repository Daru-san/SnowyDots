{
  config,
  pkgs,
  ...
}: let
  walls = with builtins;
    fetchGit {
      url = "https://github.com/D3Ext/aesthetic-wallpapers";
      rev = "060c580dcc11afea2f77f9073bd8710920e176d8";
    }
    + "/images";
  cfg = config.theme.wallpaper;
in {
  home.packages = with pkgs; [swww];

  theme.wallpaper = {
    image = "${walls}/minimal_c.png";
    path = "${walls}";
  };
  home.file."Wallpapers/aesthetic".source = "${walls}";
}
