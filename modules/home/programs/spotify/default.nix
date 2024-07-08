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
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      lyricsPlus
      betterLibrary
      historyInSidebar
      {
        src = pkgs.fetchFromGitHub {
          owner = "Bergbok";
          repo = "Spicetify-Creations";
          rev = "035ee40be7705f5a292db4967c2b9f92e9bb503f";
          hash = "sha256-tS/jkq1A5wkVOXHE9RtyWwn5iKlGCEJAuiLYoWiOZzM=";
        };
        name = "Tags";
      }
    ];
  };
}
