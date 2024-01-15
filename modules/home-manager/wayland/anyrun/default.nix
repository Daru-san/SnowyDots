{ pkgs, inputs, system,...}:{
  imports = [ inputs.anyrun.homeManagerModules.default ];
  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${system}; [
        applications
        rink
        shell
        translate
      ];

      width.fraction = 0.3;
      y.absolute = 50;
      hidePluginInfo = false;
      closeOnClick = true;
    };

    extraCss = (builtins.readFile ./style.css);
  };
}
