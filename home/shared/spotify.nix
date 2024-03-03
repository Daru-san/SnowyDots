{
  pkgs,
  inputs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["spotify"];

  # configure spicetify :)
  programs.spicetify = {
    #Enable spicetify
    enable = true;

    spotifyPackage = pkgs.spotify;
    #Spicetify theme
    theme = spicePkgs.themes.Dribbblish; # Or Ziro
    colorScheme = "Lunar"; # Grey dark

    #Spicetify extensions
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplayMod
      loopyLoop
      powerBar
      bookmark
      autoVolume
      historyShortcut
      copyToClipboard
      volumePercentage
      adblock
      shuffle
      playlistIcons
      featureShuffle
    ];

    #Custom apps
    enabledCustomApps = with spicePkgs.apps; [
      new-releases
      marketplace
      lyrics-plus
    ];
  };
}
