{config, ...}: let
  cfg = config.fonts;
in {
  imports = [./default.nix];
  config = {
    fonts.fontconfig.enable = true;
    home.packages = with cfg; [
      monospace.package
      serif.package
      sansSerif.package
      extraFonts
    ];
  };
}
