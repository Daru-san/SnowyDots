{
  pkgs,
  inputs,
  config,
  lib,
  # sysConfig ? (import <nixpkgs/nixos> {}).config,
  ...
}: let
  cfg = config.wayland.launcher.anyrun;
in
  with lib; {
    imports = [inputs.anyrun.homeManagerModules.default];
    options.wayland.launcher.anyrun.enable = mkEnableOption "Enable anyrun";
    config.programs.anyrun = mkIf cfg.enable {
      enable = true;

      config = {
        plugins =
          (with inputs.anyrun.packages.${pkgs.system}; [
            rink
            shell
            applications
            dictionary
            websearch
          ])
          ++ (with inputs.anyrun-nixos-options.packages.${pkgs.system}; [default]);

        width.fraction = 0.3;
        y.absolute = 70;
        hidePluginInfo = true;
        closeOnClick = true;
      };

      extraCss = builtins.readFile ./style.css;

      extraConfigFiles = {
        "nixos-options.ron".text = let
          # nixos-options =
          # sysConfig.system.build.manual.optionsJSON
          # + "/share/doc/nixos/options.json";
          hm-options =
            inputs.home-manager.packages.${pkgs.system}.docs-json
            + "/share/doc/home-manager/options.json";

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
            engines = [Brave]
          )
        '';
      };
    };
  }
