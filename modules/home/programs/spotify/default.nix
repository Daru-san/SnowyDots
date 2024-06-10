{
  system,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${system}.default;
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      powerBar
      autoVolume
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
      history-in-sidebar
    ];
  };
}
