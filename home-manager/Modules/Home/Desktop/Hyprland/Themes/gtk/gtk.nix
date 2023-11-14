{config, pkgs, ...}:{
  gtk = {
     enable = true;
     theme = {
        name = "Orchis-Dark";
        package = pkgs.orchis-theme;
    };
    iconTheme = {
          name = "ePapirus-Dark";
          package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
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
    home.sessionVariables = {
      GTK_THEME = "Orchis-Dark";
    };
    home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
}
