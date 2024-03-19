# Firefox theme for this user
let
  # Fetch css from Godiesc/firefox-one
  src = builtins.fetchGit {
    url = "https://github.com/Godiesc/firefox-one";
    rev = "33e012a4d9ac45342bf159bffb2779b6147ac5d2";
  };
in {
  home.file.".mozilla/firefox/daru/chrome" = {
    source = "${src}/chrome";
  };

  # Custom settings for firefoxone
  programs.firefox.profiles.daru.settings = {
    "firefoxone.without-default-colors" = true;
    "firefoxone.tree_tabs_style" = true;
    "firefoxone.rhythm_sound_tab" = true;
    "firefoxone.selected_tab_gradient_border" = true;
    "firefoxone.style_without_leftsidebar" = true;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "svg.context-properties.content.enabled" = true;
    "layout.css.color-mix.enabled" = true;
    "layout.css.backdrop-filter.enabled" = true;
    "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
    "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
  };
}
