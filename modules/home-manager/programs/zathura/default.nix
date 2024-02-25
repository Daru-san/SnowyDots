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
    extraConfig = let
      base16-zathura = with pkgs;
        fetchFromGitHub {
          owner = "HaoZeke";
          repo = "base16-zathura";
          rev = "9f148b4001dc67d399e645919225943d47e50125";
          hash = "sha256-nVJoygnytYN40VHXpAFwO7ruVbaSydeR547MU45VSuY=";
        };
      theme = "material-darker";
    in
      with builtins; readFile "${base16-zathura}/build_schemes/colors/base16-${theme}.config";
  };
}
