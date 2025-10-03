{ inputs, ... }:
{
  imports = [
    inputs.yazelix-hm.homeManagerModules.default
  ];
  xdg.configFile."yazelix" = {
    recursive = true;
    source = inputs.yazelix;
  };
  programs.yazelix = {
    enable = true;
    recommended_deps = false;
    yazi_extensions = false;
    preferred_terminal = "alacritty";
  };
}
