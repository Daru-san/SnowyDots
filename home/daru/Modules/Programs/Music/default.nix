# Music configuration
{outputs, pkgs, ...}:{
  imports = with outputs.homeManagerModules; [
    cava
    easyeffects
  ] ++ [
    ./spotify.nix
  ];
  home.packages = with pkgs; [
    cmus
    cmusfm
  ];
}
