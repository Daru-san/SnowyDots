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
  extraConfig = {
    gtk-decoration-layout = "";
  };
in {
  gtk = {
    enable = true;

    theme = {
      name = "Colloid-Grey-Dark";
      package = pkgs.colloid-gtk-theme.override {
        colorVariants = ["dark"];
        themeVariants = ["green" "default" "grey"];
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

    gtk3 = {inherit extraCss extraConfig;};
    gtk4 = {inherit extraCss extraConfig;};
  };
  dconf.settings = {
    # Make gtk apps follow a dark theme
    "org/gnome/desktop/interface" = {color-scheme = "prefer-dark";};
    # Remove buttons in gtk apps
    "org/gnome/desktop/wm/preferences" = {button-layout = "appmenu";};
  };
  home = {
    pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 23;
      gtk.enable = true;
    };
    sessionVariables = {GTK_THEME = "Colloid-Green-Dark";};
    file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
  };
}
