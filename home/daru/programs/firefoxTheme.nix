# Firefox theme for this user
{
  pkgs,
  config,
  inputs,
  ...
}: let
  # Fetch css from bjesus/fireside on github
  src = pkgs.fetchgit {
    url = "https://github.com/bjesus/fireside";
    rev = "ae26321db68d2cefe44fd74a8678aa13b83d36f5";
    sha256 = "mwlw8PNurozOBvfG6D809fxQmqiutakWq89h4UGbcXo=";
  };
in {
  programs.firefox = {
    profiles.daru = {
      # Custom css
      userChrome = with builtins; readFile "${src}/userChrome.css";
    };
  };
}
