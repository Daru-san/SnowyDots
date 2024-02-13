{ ... }: {
  imports = [ ./qt.nix ./fonts.nix ./gtk.nix ];

  # Colorscheme file
  xdg.configFile."colorScheme.css".text = (builtins.readFile ./oxocarbon.css);
}
