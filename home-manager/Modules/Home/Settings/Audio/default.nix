{config, pkgs, ...}:{
  home.packages = with pkgs; [
    easyeffects #Add easyeffects for EQ and audio effects
  ];
}
