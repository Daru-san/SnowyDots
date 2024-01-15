{
  inputs,
  ...
}:
{
  imports = [
    ./gtk.nix
    ./qt.nix
    ./fonts.nix
  ];

  #Set colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.onedark;
}
