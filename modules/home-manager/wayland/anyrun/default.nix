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
      plugins =
      (with inputs.anyrun.packages.${pkgs.system}; [ rink shell ])
      ++
      (with inputs.anyrun-nixos-options.packages.${pkgs.system};[ default ])
      ++
      (with inputs.anyrun-plugins.packages.${pkgs.system}; [ applications hyprwin ])
      ++
      (with inputs.anyrun-cliphist.packages.${pkgs.system}; [ default ]);

      width.fraction = 0.3;
      y.absolute = 50;
      hidePluginInfo = false;
      closeOnClick = true;
    };

    extraCss = (builtins.readFile ./style.css);

    extraConfigFiles = {
      "nixos-options.ron".text = let
        # nixos-options = osConfig.system.build.manual.optionsJSON + "/share/doc/nixos/options.json";
        hm-options = inputs.home-manager.packages.${pkgs.system}.docs-json + "/share/doc/home-manager/options.json";

        # merge your options
        options = builtins.toJSON {
          # ":nix" = [nixos-options];
          ":hm" = [hm-options];
        };

      in ''
        Config(
            // add your option paths
            options: ${options},
         )
      '';
      "randr.ron".text = ''
        Config(
          prefix: ":dp",
          max_entries: 5,
        )
      '';
      "shell.ron".text = ''
        Config(
          prefix: ":sh",
          shell: None,
        )
      '';
      "cliphist.ron".text = ''
        Config(
          cliphist_path: "cliphist",
          max_entries: 14,
          prefix: ":v",
        )
      '';
      "hyprwin.ron".text = ''
        Config(
          max_entries: 5,
          prefix: ":w",
        )
      '';
      "applications.ron".text = ''
        Config(
          desktop_actions: true,
          max_entries: 5,
          terminal: Some("kitty"),
        )
      '';
    };
  };
}
