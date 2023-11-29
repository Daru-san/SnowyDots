{config, pkgs, ...}:{
  home.packages = with pkgs; [
    jamesdsp #Add jamesdsp for EQ and audio effects
  ];
}
