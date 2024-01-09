# Music configuration
{outputs, pkgs, ...}:{
  imports = with outputs.homeManagerModules; [
    easyeffects
  ] ++ [
    ./spotify.nix
    ./ncmpcpp.nix
  ];
  home.packages = with pkgs; [
    musikcube
  ];
}
