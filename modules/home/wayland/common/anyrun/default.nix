{
  config,
  ...
}:
{
  programs.anyrun = {
    config = {
      plugins =
        let
          plugin = plugin: "${config.programs.anyrun.package}/lib/lib${plugin}.so";
        in
        [
          (plugin "rink")
          (plugin "shell")
          (plugin "applications")
          (plugin "dictionary")
          (plugin "nix_run")
        ];

      width.fraction = 0.64;
      y.absolute = 310;
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
      "nix-run.ron".text = ''
        Config(
          prefix: ":nr ",
          // Whether or not to allow unfree packages
          allow_unfree: true,
          // Nixpkgs channel to get the package list from
          channel: "nixpkgs-unstable",
          max_entries: 3,
        )
      '';
    };
  };
}
