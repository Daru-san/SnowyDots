{pkgs, ...}: let

  # Fetch custom css theme from Godiesc/firefox-one on github
  firefoxOne = pkgs.fetchgit {
    url = "https://github.com/Godiesc/firefox-one";
    rev = "974fee10ce0ebc9b4025b90bb18d05d74c46230f";
    sha256 = "t9j9p2nalanN1OdJCjuuFZfIQwKRS6FTD5HaGEcAlmA=";
  };

  # Fetch custom css theem from datguypiko/Firefox-Mod-Blur on github
  ffModBlur = pkgs.fetchgit {
    url = "https://github.com/datguypiko/Firefox-Mod-Blur";
    rev = "e4c5d1384c839635043242597b66d0af0b288d48";
    sha256 = "XQcgNwUqFmBumTYUfveIuPGAEAX91ah0MyGuhv/XAoU=";
  };

in {

  # FirefoxOne symlinks
  # home.file = {
  #   ".mozilla/firefox/daru/chrome" = {
  #     source = "${firefoxOne}/chrome";
  #   };
  # };

  # Firefox Mod Blur symlinks
  home.file = {
    ".mozilla/firefox/daru/chrome/userChrome.css" = {
      source = "${ffModBlur}/userChrome.css";
    };
    ".mozilla/firefox/daru/chrome/userContent.css" = {
      source = "${ffModBlur}/userContent.css";
    };
    ".mozilla/firefox/daru/chrome/image" = {
      source = "${ffModBlur}/image";
    };
    ".mozilla/firefox/daru/chrome/old" = {
      source = "${ffModBlur}/old";
    };
    ".mozilla/firefox/daru/chrome/extras" = {
      source = "${ffModBlur}/EXTRA MODS";
    };
  };

}
