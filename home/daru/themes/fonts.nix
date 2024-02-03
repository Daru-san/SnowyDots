{pkgs,config,...}:{
  # Stylix specific options
  stylix.fonts = {
    serif = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
    };
    sansSerif = config.stylix.fonts.serif;
    monospace = {
      package = pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; };
      name = "JetbrainsMono Nerd Font";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
    sizes = {
      desktop = 15;
      applications = 13;
      popups = 13;
      terminal = 15;
    };
  };
}
