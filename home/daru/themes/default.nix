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
