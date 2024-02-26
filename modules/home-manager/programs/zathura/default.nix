{
  config,
  pkgs,
  ...
}: {
  programs.zathura = {
    enable = true;
    package = pkgs.zathura.overrideAttrs (o: {
          patches = (o.patches or [ ]) ++ [
            
          ];
        });
    options = {
      recolor = true;
      recolor-keephue = true;
      default-bg = "rgba(255,255,255,0)";
      recolor-lightcolor = "rgba(255,255,255,0)";
      recolor-darkcolor = "black";
      font = config.fonts.serif.name;
      page-padding = 3;
      window-title-basename = true;
    };
  };
}
