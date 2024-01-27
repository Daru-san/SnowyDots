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

  xdg.configFile."colorscheme.css".text = (builtins.readFile ./oxocarbon-dark.css);
}
