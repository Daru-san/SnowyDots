{pkgs, ...}:{
  qt = {
    enable = true;

    #Allow qt applications to follow custom theme controlled by qtct 
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
    };
  };
}
