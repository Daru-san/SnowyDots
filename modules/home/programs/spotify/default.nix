{
  system,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    enabledSnippets = with spicePkgs.snippets; [
      autoHideFriends
      hideFriendsActivityButton
      removePopular
      hideMadeForYou
      removeConnectBar
      fixLikedButton
      fixLikedIcon
      hideDownloadButton
      hideNowPlayingViewButton
      hideProfileUsername
      ''
        section[data-testid='home-page'] .main-shelf-shelf:not([aria-label='Recently played'], [aria-label='Your playlists']) {
          display: none !important;
        }
      ''
    ];
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      powerBar
      oldSidebar
      history
      shuffle
      fullAppDisplay
      playNext
      volumePercentage
      writeify
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      lyricsPlus
      betterLibrary
      historyInSidebar
    ];
  };
}
