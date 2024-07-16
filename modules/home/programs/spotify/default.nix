{
  system,
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    enabledSnippets = with spicePkgs.snippets; [
      auto-hide-friends
      hide-friends-activity-button
      remove-popular
      Hide-Made-For-YOU
      remove-connect-bar
      fix-liked-button
      fix-liked-icon
      hide-download-button
      hide-now-playing-view-button
      hide-profile-username
      ''
        section[data-testid='home-page'] .main-shelf-shelf:not([aria-label='Recently played'], [aria-label='Your playlists']) {
          display: none !important;
        }
      ''
    ];
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      powerBar
      oldSidebar
      history
      shuffle
      fullAppDisplay
      playNext
      volumePercentage
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      lyricsPlus
      betterLibrary
      historyInSidebar
    ];
  };
}
