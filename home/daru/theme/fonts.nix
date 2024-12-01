{
  pkgs,
  config,
  ...
}:
{
  fonts = {
    serif = {
      package = pkgs.rubik;
      name = "Rubik";
    };
    sansSerif = config.fonts.serif;
    monospace = {
      package = pkgs.nerd-fonts.zed-mono;
      name = "ZedMono Nerd Font Propo";
    };
    sizes = {
      desktop = 14;
      applications = 14;
      terminal = 14;
    };
    extraFonts = with pkgs; [
      monocraft
      comic-relief
      noto-fonts
    ];
  };
}
