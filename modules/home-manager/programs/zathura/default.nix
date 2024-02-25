{
  config,
  pkgs,
  ...
}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-lightcolor = "rgba(36, 40, 59, 0.6)";
      recolor-darkcolor = "rgba(0, 0, 0, 0.3)";
      font = config.fonts.serif.name;
      page-padding = 3;
      window-title-basename = true;
    };
    mappings = {
      m = "set recolor true";
    };
  };
}
