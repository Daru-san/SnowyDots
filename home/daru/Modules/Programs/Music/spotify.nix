{ pkgs, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{

  nixpkgs = {
    # Allow spotify to be installed, even if it's unfree
    config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "spotify"
    ];
  };
  # configure spicetify :)
  programs.spicetify = {

    #Enable spicetify
    enable = true;

    # Package, using an overide to enable wayland support  
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

    #Spotifd service for spotify-tui
    services.spotifyd = {
      enable = true;
      settings = {
          global = {
              username = "31qfp7msrlxcryx2zwhoa2lbts5u";
          };
      };
    };
  home.packages = with pkgs; [
    spotify-tui #Spotify-tui for terminal usage
    # spotdl # Download music
  ];
}
