{
  pkgs
, lib
, config
, ...
}:
{
  gtk = {
    enable = true;

    theme = {
      name = "Colloid-Grey-Dark";
      package = pkgs.colloid-gtk-theme.override {
        themeVariants = [ "default" "grey" ];
        colorVariants = [ "dark" ];
        sizeVariants = [ "standard" ];
        tweaks = [ "float"];
      };
    };

    font = {
      inherit (config.fonts.sansSerif) package name;
      size = config.fonts.sizes.applications;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # gtk cursor theme
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
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

  # Set gtk theme session variable for nautilus
  home.sessionVariables = {
    GTK_THEME = "Colloid-Grey-Dark";
  };

  # Set cursor themes
  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
}
