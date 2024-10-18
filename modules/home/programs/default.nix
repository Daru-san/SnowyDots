{ ... }:
{
  programs.kitty.enable = true;
  imports = [
    ./mpv
    ./btop
    ./translate-shell
    ./bat
    ./zathura
    ./obs-studio
    ./yazi
    ./freetube
    ./yt-dlp
    ./nautilus
    ./spotify
    ./floorp
  ];
}
