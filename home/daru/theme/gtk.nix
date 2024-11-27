{
  pkgs,
  config,
  lib,
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
      name = "WhiteSur-Dark-alt-green";
      package = pkgs.whitesur-gtk-theme.override {
        colorVariants = [ "Dark" ];
        themeVariants = [ "green" ];
        roundedMaxWindow = true;
        altVariants = [ "alt" ];
        opacityVariants = [ "normal" ];
      };
    };

    font = {
      inherit (config.fonts.sansSerif) package name;
      size = config.fonts.sizes.applications;
    };

    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme.override {
        boldPanelIcons = true;
        alternativeIcons = true;
        themeVariants = [
          "green"
          "default"
        ];
      };
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
  home = {
    sessionVariables.GTK_THEME = gtk.theme.name;
    pointerCursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 26;
      gtk.enable = true;
    };
  };
}
