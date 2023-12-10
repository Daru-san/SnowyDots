# Music configuration
{outputs, pkgs, ...}:{
  imports = [
    ./spotify.nix

    outputs.homeManagerModules.cava

    outputs.homeManagerModules.easyeffects
  ];
  home.packages = with pkgs; [
    cmus
    cmusfm
  ];
}
