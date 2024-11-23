{
  inputs,
  lib,
  ...
}:
rec {
  imports = [
    ./qt.nix
    ./fonts.nix
    ./gtk.nix
  ];

  # Wallpaper
  wallpaperImage = inputs.walls + "/images/dark-leaves.png";

  # Colorscheme from nix-colors
  colorScheme = inputs.nix-colors.colorSchemes.oxocarbon-dark;

  # Converting the colorscheme to css
  colorSchemeCss =
    let
      num = map toString (lib.range 0 9);
      char = [
        "A"
        "B"
        "C"
        "D"
        "E"
        "F"
      ];
    in
    lib.concatLines [
      "/* Definitions of my current color scheme */"
      (lib.concatLines (map (x: ''@define-color base0${x} #${colorScheme.palette."base0${x}"};'') num))
      (lib.concatLines (map (x: ''@define-color base0${x} #${colorScheme.palette."base0${x}"};'') char))
    ];

  # Symlink the colorscheme to a file in the home directory
  home.file."color-scheme.css".text = colorSchemeCss;
}
