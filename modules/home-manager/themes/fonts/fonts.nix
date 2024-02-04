{ config, ... }:

let
  cfg = config.fonts;
in {
  imports = [ ./default.nix ];
  config = {
    fonts.fontconfig.enable = true;
    home.packages = [
      cfg.monospace.package
      cfg.serif.package
      cfg.sansSerif.package
      cfg.extraFonts
    ];
  };
}
