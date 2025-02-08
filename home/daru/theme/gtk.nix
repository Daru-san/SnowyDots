{
  pkgs,
  config,
  ...
}:
let
  extraConfig = {
    gtk-decoration-layout = "";
  };
  iconTheme =
    let
      whitesur-fix = pkgs.whitesur-icon-theme.overrideAttrs (oldAttrs: {
        postInstall = ''
          find -L $out -type l -print -delete
        '';
      });
    in
    {
      name = "WhiteSur-dark";
      package = whitesur-fix.override {
        boldPanelIcons = true;
        alternativeIcons = true;
        themeVariants = [
          "green"
          "default"
        ];
      };
    };
in
rec {
  gtk = {
    enable = true;

    theme = {
      name = "WhiteSur-Dark-alt-green";
      package = pkgs.whitesur-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [ "green" ];
        roundedMaxWindow = true;
        altVariants = [ "alt" ];
        opacityVariants = [ "normal" ];
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

  stylix = {
    iconTheme = {
      enable = true;
      dark = iconTheme.name;
      light = iconTheme.name;
      package = iconTheme.package;
    };

    cursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 26;
    };
  };
}
