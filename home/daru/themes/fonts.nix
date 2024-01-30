# System fonts
{pkgs,config, ...}:{

  # Stylix specific options
  stylix.fonts = {
    serif = {
      package = pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; };
      name = "JetBrainsMono Nerd Font";
    };
    sansSerif = config.stylix.fonts.serif;
    monospace = {
      package = pkgs.nerdfonts.override { fonts = ["UbuntuMono"]; };
      name = "UbuntuMono Nerd Font";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
  stylix.fonts.sizes = {
    desktop = 14;
    applications = 12;
    popups = 12;
    terminal = 15;
  };
}
