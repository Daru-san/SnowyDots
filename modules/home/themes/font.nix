{
  config,
  lib,
  ...
}:
let
  inherit (lib.lists) flatten;
  cfg = config.fonts;
in
{
  imports = [ ./font-opts.nix ];
  config = {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = with cfg; {
        monospace = [ monospace.name ];
        sansSerif = [ sansSerif.name ];
        serif = [ serif.name ];
      };
    };
    home.packages = flatten (
      with cfg;
      [
        monospace.package
        serif.package
        sansSerif.package
        extraFonts
      ]
    );
  };
}
