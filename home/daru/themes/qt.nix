{ pkgs, ... }: {
  qt = {
    enable = true;

    #Allow qt applications to follow custom theme controlled by qtct 
    platformTheme = "kde";
    style = { name = "adwaita-dark"; };
  };
}
