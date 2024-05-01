{
  pkgs,
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
      history
      historyShortcut
      keyboardShortcut
      copyToClipboard
      volumePercentage
      adblock
      shuffle
      playlistIcons
    ];
    enabledCustomApps = let
      better-library = pkgs.fetchzip {
        url = "https://github.com/Sowgro/betterLibrary/archive/refs/tags/3.0.zip";
        hash = "sha256-8xdhNvL2yF9bFzEH4JUAcOxexdoif9czpUHI3K7cPWk=";
      };
    in
      [
        {
          name = "betterLibrary";
          src = better-library + "/CustomApps/betterLibrary";
          appendName = false;
        }
      ]
      ++ (with spicePkgs.apps; [new-releases lyrics-plus]);
  };
}
