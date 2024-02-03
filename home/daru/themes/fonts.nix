{pkgs,config,...}:{
  fonts = {
    serif = {
      package = pkgs.noto-fonts;
      name = "Noto Sans SemiBold";
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
      applications = 14;
      popups = 14;
      terminal = 15.7;
    };
  };
}
