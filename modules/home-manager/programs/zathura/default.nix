{
  config,
  pkgs,
  ...
}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-keephue = true;
      default-bg = "rgba(255,255,255,0.7)";
      recolor-lightcolor = "rgba(255,255,255,0)";
      recolor-darkcolor = "black";
      font = config.fonts.serif.name;
      page-padding = 3;
      window-title-basename = true;
    };
    mappings = {
      m = "set recolor true";
    };
  };
}
