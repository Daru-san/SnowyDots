#Fonts for Hyprland
{config, pkgs, ...}:{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "RobotoMono" ]; })
  ];
}
