{pkgs, ...}:{
  qt = {
    enable = true;

    #Allow qt applications to follow KDE theme 
    platformTheme = "gtk";
    style = {
      name = "gtk2";
    };
  };
}
