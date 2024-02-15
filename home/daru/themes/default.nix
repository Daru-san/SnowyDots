{...}: {
  imports = [./qt.nix ./fonts.nix ./gtk.nix];

  # Colorscheme file
  theme.colorScheme.css = builtins.readFile ./oxocarbon.css;
}
