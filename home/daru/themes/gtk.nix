{pkgs, ...}:{
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

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # gtk cursor theme
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    # Make gtk applications prefer dark mode
    gtk3 = {
      extraConfig = {
        settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };
    gtk4.extraConfig = {
      settings = ''
        gtk-application-prefer-dark-theme=1
      '';
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
