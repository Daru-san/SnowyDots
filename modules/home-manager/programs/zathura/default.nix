{config, ...}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-darkcolor = "#161616";
      font = config.fonts.serif.name;
      page-padding = 3;
      window-title-basename = true;
    };
    mappings = {
      m = "set recolor true";
      M = "set recolor false";
    };
    extraConfig = let
      base16-zathura = fetchFromGitHub {
        owner = "HaoZeke";
        repo = "base16-zathura";
        rev = "9f148b4001dc67d399e645919225943d47e50125";
        hash = "sha256-nVJoygnytYN40VHXpAFwO7ruVbaSydeR547MU45VSuY=";
      };
      theme = "onedark";
    in ''
      ${builtins.readFile ./${base16-zathura}/build_schemes/colors/base16-${theme}.config}
    '';
  };
}
