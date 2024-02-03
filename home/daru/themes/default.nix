{
  ...
}:
{
  imports = [
    ./qt.nix
    ./fonts.nix
    ./stylix.nix
    ./gtk.nix
  ];

  # Colorscheme file
  xdg.configFile."colorScheme.css".text = (builtins.readFile ./oxocarbon.css);
}
