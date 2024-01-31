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
    base16Scheme = "${inputs.base16-schemes}/material-darker.yaml";
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

  # More colors for kitty
  stylix.targets.kitty.variant256Colors = true;

  # Enable custom configuration for waybar and neovim
  stylix.targets = {
    vim.enable = false;
    waybar.enable = false;
  };

  # Colorscheme file
  xdg.configFile."colorScheme.css".text = (builtins.readFile ./oxocarbon.css);
}
