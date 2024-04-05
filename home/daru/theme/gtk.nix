{
  pkgs,
  config,
  lib,
  ...
}: let
  extraCss = lib.concatStringsSep "\n" [
    config.colorSchemeCss
    (builtins.readFile ./gtk.css)
  ];
in {
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    font = {
      inherit (config.fonts.sansSerif) package name;
      size = config.fonts.sizes.applications;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "bluegrey";
      };
    };

    # gtk cursor theme
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    gtk3 = {inherit extraCss;};
    gtk4 = {inherit extraCss;};
  };
  dconf.settings = {
    # Make gtk apps follow a dark theme
    "org/gnome/desktop/interface" = {color-scheme = "prefer-dark";};
    # Remove buttons in gtk apps
    "org/gnome/desktop/wm/preferences" = {button-layout = "appmenu";};
  };

  # Set gtk theme session variable for nautilus
  home.sessionVariables = {GTK_THEME = "adw-gtk3-dark";};

  # Set cursor themes
  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
}
