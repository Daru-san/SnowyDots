{ pkgs, inputs, lib, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # configure spicetify :)
  programs.spicetify = {

    #Enable spicetify
    enable = true;

    spotifyPackage = pkgs.spotify;
    #Spicetify theme
    theme = spicePkgs.themes.Comfy;
    colorScheme = "Forest"; 

    #Spicetify extensions
    enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplayMod
        loopyLoop
        powerBar
        seekSong
        bookmark
        autoVolume
        historyShortcut
        copyToClipboard
        genre
        volumePercentage
        playNext
        savePlaylists
        adblock
        shuffle
        lastfm
        playlistIcons
        goToSong
        listPlaylistsWithSong
        featureShuffle
        playlistIntersection
        skipOrPlayLikedSongs
      ];

      #Custom apps
    enabledCustomApps = with spicePkgs.apps; [
      new-releases
      marketplace
      localFiles
      lyrics-plus
    ];
  };
}
