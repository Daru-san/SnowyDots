{pkgs, ...}:{
  gtk = {
    enable = true;

    theme = {
      name = "Colloid-Green-Dark-Nord";
      package = pkgs.colloid-gtk-theme.override {
        themeVariants = [ "default" "green" ];
        colorVariants = [ "dark" ];
        sizeVariants = [ "standard" ];
        tweaks = [ "nord" "float"];
      };
    };

    iconTheme = {
      name = "Papirus-Dark-Maia";
      package = pkgs.papirus-maia-icon-theme;
    };
    font = {
      name = "Jetbrains Mono Nerd Font";
      size = 12;
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
    GTK_THEME = "Colloid-Green-Dark-Nord";
  };

  # Set cursor themes
  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
}
