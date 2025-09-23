{
  system,
  inputs,
  config,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
  color = color: config.stylix.generated.palette.${color};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text // {
      additionalCss = # css
        ''
          :root {
              --font-family: "Noto Mono", monospace;

              --font-size: 14px;
              --font-weight: 400; /* 200 : 900 */
              --line-height: 1.2;

              --font-size-lyrics: 14px; /* 1.5em (default) */

              --font-family-header: "asciid";
              --font-size-multiplier-header: 4;

              --display-card-image: block; /* none | block */
              --display-coverart-image: none; /* none | block */
              --display-header-image: none; /* none | block */
              --display-sidebar-image: block; /* none | block */
              --display-tracklist-image: none; /* none | block */
              --display-spicetify-banner-ascii: block; /* none | block */
              --display-music-banner-ascii: none; /* none | block */

              --border-radius: 0px;
              --border-width: 1px;
              --border-style: solid; /* dotted | dashed | solid | double | groove | ridge | inset | outset */
              --border-transition: 0.2s ease; /* 'none' to disable  */

              --global-nav-margin-top: 40px /* set to '0px' if you disabled window controls */
          }
        '';
    };
    customColorScheme = {
      text = color "base05";
      subtext = color "base05";
      main = color "base00";
      highlight = color "base02";
      accent = color "base08";
      accent-inactive = color "base00";
      sidebar = color "base01";
      player = color "base04";
      card = color "base03";
      shadow = color "base00";
      selected-row = color "base04";
      button = color "base04";
      button-active = color "base04";
      button-disabled = color "base03";
      tab-active = color "base02";
      notification = color "base02";
      notification-error = color "base08";
      equalizer = color "base0B";
    };
    enabledSnippets = with spicePkgs.snippets; [
      autoHideFriends
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
      shuffle
      fullAppDisplay
      playNext
      volumePercentage
      writeify
      lastfm
      seekSong
      wikify
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      lyricsPlus
      betterLibrary
      historyInSidebar
    ];
  };
}
