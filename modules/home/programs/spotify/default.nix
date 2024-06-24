{
  system,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
  sources = import ./nix/sources.nix;
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];
  programs.spicetify = {
    enable = true;
    theme = {
      name = "Dribbblish";
      src = "${sources.spicetify-themes}/Dribbblish";
      requiredExtensions = [
        {
          src = "${sources.spicetify-themes}/Dribbblish";
          name = "theme.js";
        }
      ];
      patches = {
        "xpui.js_find_8008" = ",(\\w+=)32";
        "xpui.js_repl_8008" = ",\${1}56";
      };
      overwriteAssets = true;
      additionalCss = ''
        .Root {
          padding-top: 0px;
        }
        .main-shelf-shelf:has([href="/genre/recently-played"]) {
          display: none !important;
        }
        .main-shelf-shelf.Shelf:has(
            [href="/section/0JQ5DAuChZYPe9iDhh2mJz"],
            [href="/section/0JQ5DAnM3wGh0gz1MXnu4h"],
            [href="/section/0JQ5DAnM3wGh0gz1MXnu3B"],
            [href="/section/0JQ5DAnM3wGh0gz1MXnu3D"]
          ) {
          display: none !important;
        }
        [data-testid="home-page"]
          .main-home-content
          > *:not(
            .view-homeShortcutsGrid-shortcuts,
            .main-shelf-shelf:has(
                [href="/genre/recently-played"],
                [href="/section/0JQ5DAnM3wGh0gz1MXnu3z"]
              )
          ) {
          display: none !important;
        }
      '';
    };
    colorScheme = "Lunar";
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      adblock
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      lyricsPlus
    ];
  };
}
