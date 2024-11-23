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
      package = pkgs.nerdfonts.override {
        fonts = [ "CascadiaCode" ];
      };
      name = "CaskaydiaCove-NFP";
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
