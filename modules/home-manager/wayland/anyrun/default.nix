{ 
  pkgs, 
  inputs,
  ...
}:
{
  imports = [ inputs.anyrun.homeManagerModules.default ];
  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
      ];

      width.fraction = 0.3;
      y.absolute = 50;
      hidePluginInfo = false;
      closeOnClick = true;
    };

    extraCss = (builtins.readFile ./style.css);
  };
}
