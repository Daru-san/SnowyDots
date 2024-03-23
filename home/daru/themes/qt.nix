{pkgs, ...}: {
  qt = {
    enable = true;

    platformTheme = "gtk";
    style = {
      name = "Colloid-dark";
      package = pkgs.colloid-kde;
    };
  };
}
