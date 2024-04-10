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
      size = 15;
      gtk.enable = true;
    };
    sessionVariables = {GTK_THEME = "adw-gtk3-dark";};
    file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
  };
}
