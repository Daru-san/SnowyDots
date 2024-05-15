{
  pkgs,
  inputs,
  system,
  ...
}: let
  plugins = inputs.anyrun.packages.${system};
in {
  imports = [inputs.anyrun.homeManagerModules.default];
  programs.anyrun = {
    package = pkgs.anyrun;
    config = {
      plugins = with plugins; [
        rink
        shell
        applications
        dictionary
        websearch
      ];

      width.fraction = 0.3;
      y.absolute = 70;
      hidePluginInfo = true;
      closeOnClick = true;
    };
    extraCss = builtins.readFile ./style.css;

    extraConfigFiles = {
      "shell.ron".text = ''
        Config(
          prefix: ":sh",
          shell: None,
        )
      '';
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
        )
      '';
      "websearch.ron".text = ''
        Config(
          prefix: "?",
          Custom(
            name: "Brave",
            url: "search.brave.com/search?q={}",
          )
          engines: [Brave]
        )
      '';
    };
  };
}
