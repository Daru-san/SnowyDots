{
  pkgs,
  config,
  ...
}: {
  fonts = {
    serif = {
      package = pkgs.noto-fonts;
      name = "Noto Sans SemiBold";
    };
    sansSerif = config.fonts.serif;
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetbrainsMono Nerd Font";
    };
    sizes = {
      desktop = 15;
      applications = 15;
      terminal = 16;
    };
    extraFonts = with pkgs; [monocraft noto-fonts];
  };
}
