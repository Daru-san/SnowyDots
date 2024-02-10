# Music configuration
{pkgs, ...}:{
 imports = [
    ./spotify.nix
  ];
  home.packages = with pkgs; [
    musikcube
  ];
}
