{ pkgs, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  # imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # configure spicetify :)
  programs.spicetify = let
    #Import officialThemes since 'text isn't provided by default
    officialThemes = pkgs.fetchgit {
      url = "https://github.com/spicetify/spicetify-themes";
      sha256 = "0sab8jh4867fh66zdz7msg1bwwqpm0zc6y20hw7328p7agcr7xlk";
      rev = "2e124a90561649a8aa410e89c6893e5b5d4816b9";
    };
  in 
    {

    #Enable spicetify
    enable = true;
#Spicetify theme
    theme = {
      name = "text";
        src = officialThemes;
        appendName = true;
        injectCss = true;
        replaceColors = true;
        overwriteAssets = true;
        sidebarConfig = true;
        patches = {
          "xpui.js_find_0880" = "COLLAPSED\?64:32";
          "xpui.js_repl_0880" = "COLLAPSED?32:32";
          "xpui.js_find_8008" = ",(\w+=)56,";
          "xpui.js_repl_8008" = ",$1}32,";
        };
      };
    colorScheme = "Spotify";
      # customColorScheme = {
      #   accent = "76946A";
      #   accent-active = "98BB6C";
      #   accent-inactive = "1F1F28";
      #   banner = "98BB6C";
      #   border-active = "98BB6C";
      #   border-inactive = "2A2A37";
      #   header = "54546D";
      #   highlight = "363646";
      #   main = "1F1F28";
      #   notification = "7E9CD8";
      #   notification-error = "E82424";
      #   subtext = "C8C093";
      #   text = "DCD7BA";
      # };

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
  ];
}
