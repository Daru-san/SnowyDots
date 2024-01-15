{inputs, ...}:let
  nix-colors = inputs.nix-colors;
in {
  imports = [
    ./gtk.nix
    ./qt.nix
    ./fonts.nix
  ];

  #Set colorscheme
  colorScheme = nix-colors.colorSchemes.onedark; 
}
