{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./qt.nix
    ./fonts.nix
  ];

  # Set colorscheme
  stylix = {
    polarity = "dark";
    base16Scheme = "${inputs.base16-schemes}/atelier-cave.yaml";
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
  };

  # Enable custom configurations
  stylix.targets = {
    vim.enable = false;
    waybar.enable = false;
    kitty.enable = true;
    kitty.variant256Colors = true;
  };

  # Colorscheme file
  xdg.configFile."colorScheme.css".text = (builtins.readFile ./oxocarbon.css);

  # gtk configurations
  gtk.enable = true;
  gtk.theme = lib.mkForce {
    name = "Colloid-Grey-Dark";
    package = pkgs.colloid-gtk-theme.override {
      themeVariants = [ "default" "grey" ];
      colorVariants = [ "dark" ];
      sizeVariants = [ "standard" ];
      tweaks = [ "float"];
    };
  };
  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };
  dconf.settings = {
    # Make gtk apps follow a dark theme
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    # Remove buttons in gtk apps
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu";
    };
  };
  home.sessionVariables = {
    GTK_THEME = "Colloid-Grey-Dark";
  };
}
