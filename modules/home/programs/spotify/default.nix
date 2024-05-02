{
  system,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${system}.default;
in {
  imports = with inputs.spicetify-nix.homeManagerModules; [spicetify ./spotify-player.nix];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
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
    enabledCustomApps = with spicePkgs.apps; [
      new-releases
      lyrics-plus
      library
      statistics
      history-in-sidebar
      betterLocalFiles
      playlistTags
    ];
  };
}
