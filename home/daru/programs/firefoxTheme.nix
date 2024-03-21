# Firefox theme for this user
let
  # Fetch css from Godiesc/firefox-one
  src = builtins.fetchGit {
    url = "https://github.com/christorange/VerticalFox";
    rev = "29d7ee3f320bc52bb928a1b0ba82457a6583fbfe";
  };
in {
  home.file.".mozilla/firefox/daru/chrome" = {source = "${src}/windows";};

  # Custom settings for firefoxone
  programs.firefox.profiles.daru.settings = {
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
}
