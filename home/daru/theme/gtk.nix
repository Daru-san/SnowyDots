{
  pkgs,
  config,
  ...
}:
let
  extraConfig = {
    gtk-decoration-layout = "";
  };
in
rec {
  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Grey-Dark-Compact";
      package = pkgs.colloid-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [
          "green"
          "default"
          "grey"
        ];
        sizeVariants = [ "compact" ];
      };
    };

    font = {
      inherit (config.stylix.fonts.sansSerif) package name;
      size = config.stylix.fonts.sizes.applications;
    };

    gtk3 = {
      inherit extraConfig;
    };
    gtk4 = {
      inherit extraConfig;
    };
  };
  dconf.settings = {
    # Make gtk apps follow a dark theme
    "org/gnome/desktop/interface" = {
      gtk-theme = gtk.theme.name;
      color-scheme = "prefer-dark";
    };
    # Remove buttons in gtk apps
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu";
    };
  };
  home.sessionVariables.GTK_THEME = gtk.theme.name;
}
