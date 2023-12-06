{pkgs, ...}:{
  gtk = {
     enable = true;

    #Set gtk theme
     theme = {
        name = "Orchis-Dark";
        package = pkgs.orchis-theme;
    };
    iconTheme = {
          name = "ePapirus-Dark";
          package = pkgs.papirus-icon-theme;
    };

    #gtk cursor theme
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    #Make gtk applications prefer dark mode
    gtk3.extraConfig = {
      settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
   };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  #Set gtk env variable
  home.sessionVariables = {
    GTK_THEME = "Orchis-Dark";
  };

  #Set cursor theme 'home wide'
  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
}