{
  inputs,
  lib,
  ...
}: rec {
  imports = [./qt.nix ./fonts.nix ./gtk.nix];

  # Wallpaper
  wallpaperImage = "${inputs.wallpapers}/images/bright-leaves.png";

  # Colorscheme from nix-colors
  colorScheme = inputs.nix-colors.colorSchemes.oxocarbon-dark;

  # Converting the colorscheme to css
  colorSchemeCss = let
    n = map toString (lib.range 0 9);
    l = ["A" "B" "C" "D" "E" "F"];
  in
    lib.concatLines [
      (map (x: ''@define-color base0${n} #${colorScheme.palette."base0${n}"}''))
      (map (x: ''@define-color base0${l} #${colorScheme.palette."base0${l}"}''))
    ];
}
