{
  pkgs,
  config,
  ...
}:
{
  stylix.fonts = {
    serif = {
      package = pkgs.rubik;
      name = "Rubik";
    };
    sansSerif = config.stylix.fonts.serif;
    monospace = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };
    sizes = {
      desktop = 12;
      applications = 12;
      terminal = 14;
    };
  };
  home.packages = with pkgs; [
    monocraft
    comic-relief
    noto-fonts
  ];
}
