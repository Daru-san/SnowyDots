{
  pkgs,
  system,
  inputs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${system}.default;
in {
  imports = with inputs.spicetify-nix.homeManagerModules; [spicetify ./spotify-player.nix];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["spotify"];
  programs.spicetify = {
    enable = true;
    spotifyPackage = pkgs.spotify;
    theme = spicePkgs.themes.text;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplayMod
      powerBar
      bookmark
      autoVolume
      history
      historyShortcut
      keyboardShortcut
      copyToClipboard
      volumePercentage
      adblock
      shuffle
      playlistIcons
    ];
    enabledCustomApps = with pkgs; let
      better-library = pkgs.fetchzip {
        url = "https://github.com/Sowgro/betterLibrary/archive/refs/tags/3.0.zip";
        hash = "sha256-8xdhNvL2yF9bFzEH4JUAcOxexdoif9czpUHI3K7cPWk=";
      };
    in
      with spicePkgs.apps; [
        new-releases
        lyrics-plus
        {
          name = "betterLibrary";
          src = better-library + "/CustomApps/betterLibrary";
          appendName = false;
        }
      ];
  };
}
