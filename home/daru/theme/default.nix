{
  inputs,
  lib,
  pkgs,
  ...
}: rec {
  imports = [./qt.nix ./fonts.nix ./gtk.nix];

  # Wallpaper
  wallpaperImage =
    pkgs.fetchFromGitHub {
      owner = "KDE";
      repo = "plasma-workspace-wallpapers";
      rev = "c091e7df788e17a6f8ca4c8917a8e09c9d6bdef0";
      hash = "sha256-l4bHVIkkkTXGcXQPpJGRByZGQxn+5IcG0g5iF8Lcwq0=";
    }
    + "/Mountain/contents/images_dark/5120x2880.png";

  # Colorscheme from nix-colors
  colorScheme = inputs.nix-colors.colorSchemes.oxocarbon-dark;

  # Converting the colorscheme to css
  colorSchemeCss = let
    num = map toString (lib.range 0 9);
    char = ["A" "B" "C" "D" "E" "F"];
  in
    lib.concatLines [
      "/* Definitions of my current color scheme */"
      (lib.concatLines (map (x: ''@define-color base0${x} #${colorScheme.palette."base0${x}"};'') num))
      (lib.concatLines (map (x: ''@define-color base0${x} #${colorScheme.palette."base0${x}"};'') char))
    ];

  # Symlink the colorscheme to a file in the home directory
  home.file."color-scheme.css".text = colorSchemeCss;
}
