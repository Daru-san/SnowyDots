{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./gtk.nix
    ./qt.nix
    ./fonts.nix
  ];

  # Set colorscheme
  stylix = {
    polarity = "dark";
    base16Scheme = "${inputs.base16-schemes}/oxocarbon-dark.yaml";
  };

  # Window opacity
  stylix.opacity = {
    applications = 0.9;
    desktop = 0.4;
    popups = 0.8;
    terminal = 0.4;
  };

  # Cursor
  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 32;
  };
  stylix.targets.kitty.variant256Colors = true;

  xdg.configFile."colorScheme.css".text = (builtins.readFile ./oxocarbon.css);
}
