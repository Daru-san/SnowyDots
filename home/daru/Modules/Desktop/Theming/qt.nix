{pkgs, ...}:{
  qt = {
    enable = true;

    #Allow qt applications to follow KDE theme 
    platformTheme = "gnome";

    #Set qt style to adwaita for a gtk feel
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}
