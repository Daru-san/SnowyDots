{pkgs, ...}:{
  qt = {
    enable = true;

    #Allow qt applications to follow custom theme controlled by qtct 
    platformTheme = "qtct";
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}
