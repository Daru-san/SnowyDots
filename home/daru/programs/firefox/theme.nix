{pkgs, ...}: let
  # Fetch css from bjesus/fireside on github
  src = pkgs.fetchgit {
    url = "https://github.com/bjesus/fireside";
    rev = "ae26321db68d2cefe44fd74a8678aa13b83d36f5";
    sha256 = "mwlw8PNurozOBvfG6D809fxQmqiutakWq89h4UGbcXo=";
  };
in {
  home.file = {
    ".mozilla/firefox/daru/chrome/userChrome.css" = {
      source = "${src}/userChrome.css";
    };
    ".mozilla/firefox/daru/tab-center-reborn.css" = {
      source = "${src}/tab-center-reborn.css";
    };
  };
}
