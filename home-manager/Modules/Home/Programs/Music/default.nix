#Music configuration
{config, pkgs, ...}:{
  imports = [
    ./Spotify/spotify.nix
    ./cmus/cmus.nix
    ./cava/default.nix
  ];
}
