# System fonts
{pkgs, ...}:{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "UbuntuMono" ]; })
  ];
  stylix.fonts = {
    serif = {
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono"] };
      name = "JetBrainsMono Nerd Font";
    };
    sansSerif = config.stylix.fonts.serif;
    monospace = {
      packages = pkgs.nerdfonts.override { fonts = ["UbuntuMono"] };
      name = "UbuntuMono Nerd Font";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
