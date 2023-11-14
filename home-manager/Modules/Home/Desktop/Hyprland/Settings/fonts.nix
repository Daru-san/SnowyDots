#Fonts for Hyprland
{pkgs, ...}:{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "RobotoMono" ]; })
  ];
}
