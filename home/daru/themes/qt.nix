{pkgs, ...}: {
  qt = {
    enable = true;

    platformTheme = "gtk";
    style = {name = "adwaita-dark";};
  };
}
