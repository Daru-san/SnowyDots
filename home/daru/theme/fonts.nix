{
  pkgs,
  config,
  ...
}:
{
  fonts.fontconfig.enable = true;
  stylix = {
    targets = {
      fontconfig.enable = true;
      font-packages.enable = true;
    };
    fonts = {
      serif = {
        package = pkgs.rubik;
        name = "Rubik";
      };
      sansSerif = config.stylix.fonts.serif;
      monospace = {
        package = pkgs.nerd-fonts.fantasque-sans-mono;
        name = "FantasqueSansM Nerd Font";
      };
      sizes = {
        desktop = 12;
        applications = 12;
        terminal = 14;
      };
    };
  };
  home.packages = with pkgs; [
    monocraft
    comic-relief
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    noto-fonts
  ];
}
