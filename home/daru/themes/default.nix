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
  colorScheme = inputs.nix-colors.colorSchemes.oxocarbon-dark;

  xdg.configFile."colorscheme.css".text = (builtins.readFile ./oxocarbon-dark.css);
}
