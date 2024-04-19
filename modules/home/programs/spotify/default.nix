{
  pkgs,
  inputs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = with inputs.spicetify-nix.homeManagerModules; [spicetify ./ncspot.nix];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["spotify"];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Ziro;
    colorScheme = "Grey Dark";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplayMod
      powerBar
      bookmark
      autoVolume
      keyboardShortcut
      copyToClipboard
      volumePercentage
      adblock
      shuffle
      playlistIcons
    ];
    enabledCustomApps = with spicePkgs.apps; let
      spicetify-apps = fetchFromGitHub {
        owner = "Pithaya";
        repo = "spicetify-apps";
        rev = "14a5536136cd2bf1f815cf1c60712b4796fcaa25";
        hash = "sha256-WI2nAxBX1UqQpGoqt8TqY9XphgE45NQfJha2mI7/p+g=";
      };
      spicetify-creations = fetchFromGitHub {
        owner = "Bergbok";
        repo = "Spicetify-Creations";
        rev = "ff22159dd2fed58357082196542fdd194facf0e4";
        hash = "sha256-yml5q3vdTsujhJLvP/Re5xeSKK9cDgf44u/tjPhxlK8=";
      };
      better-library = fetchFromGitHub {
        owner = "Sowgro";
        repo = "betterLibrary";
        rev = "c8438030837ce904cf8dc5308cfae15dc793aebd";
        hash = "sha256-8xdhNvL2yF9bFzEH4JUAcOxexdoif9czpUHI3K7cPWk=";
      };
    in [
      new-releases
      marketplace
      lyrics-plus
      {
        name = "Better Local Files";
        src = spicetify-apps + "/custom-apps/better-local-files";
        appendName = false;
      }
      {
        name = "History in Sidebar";
        src = spicetify-creations + "/CustomApps/history-in-sidebar";
        appendName = false;
      }
      {
        name = "Playlist Tags";
        src = spicetify-creations + "/CustomApps/playlist-tags";
        appendName = false;
      }
      {
        name = "betterLibrary";
        src = better-library + "/CustomApps/betterLibrary";
        appendName = false;
      }
    ];
  };
}
