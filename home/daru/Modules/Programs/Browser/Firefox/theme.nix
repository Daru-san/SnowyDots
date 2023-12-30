# TODO: Implement theme switching using if statements and variables, somehow
{pkgs, ...}: let

  # Fetch custom css theme from Godiesc/firefox-one on github
  firefoxOne = pkgs.fetchgit {
    url = "https://github.com/Godiesc/firefox-one";
    rev = "974fee10ce0ebc9b4025b90bb18d05d74c46230f";
    sha256 = "t9j9p2nalanN1OdJCjuuFZfIQwKRS6FTD5HaGEcAlmA=";
  };

  # Fetch custom css theme from datguypiko/Firefox-Mod-Blur on github
  ffModBlur = pkgs.fetchgit {
    url = "https://github.com/datguypiko/Firefox-Mod-Blur";
    rev = "e4c5d1384c839635043242597b66d0af0b288d48";
    sha256 = "XQcgNwUqFmBumTYUfveIuPGAEAX91ah0MyGuhv/XAoU=";
  };

  # Fetch custom css theme from denizjcan/Firefox-Safari-15-Theme on github 
  safari = pkgs.fetchgit {
    url = "https://github.com/denizjcan/Firefox-Safari-15-Theme";
    rev = "5bf5cf4488c7fea6d20ae423d942a77d5314bde5";
    sha256 = "WnLZEagj2BFAPYntZiboYLxyze5jhQ6DgSMgMa3Z32w=";
  };

  # Fetch custom css theme from Neikon/Fox11 on github 
  fox11 = pkgs.fetchgit {
    url = "https://github.com/Neikon/Fox11";
    rev = "9b683d2cea6cd828c6410ff497ed54a746571194"; 
    sha256 = "oJlEh/6zmnafDTXSPMsl9F9EYdT0qEdQ26D3kwUSNwg=";
  };

  # Fetch custom css theme from BlueFalconHD/SimpleFox-Feather on github
  simplefox = pkgs.fetchgit {
    url = "https://github.com/BlueFalconHD/SimpleFox-Feather";
    rev = "84f395aa58b7489d841f78baf0688763ffa793fb";
    sha256 = "BzoXCxpG88wgHLxskqQUO08QT7mB2VOLWQz8eW1w5LA=";
  };

in {

  # FirefoxOne symlinks
  # home.file = {
  #   ".mozilla/firefox/daru/chrome" = {
  #     source = "${firefoxOne}/chrome";
  #   };
  # };

  # Firefox Mod Blur symlinks
  # home.file = {
  #   ".mozilla/firefox/daru/chrome/userChrome.css" = {
  #     source = "${ffModBlur}/userChrome.css";
  #   };
  #   ".mozilla/firefox/daru/chrome/userContent.css" = {
  #     source = "${ffModBlur}/userContent.css";
  #   };
  #   ".mozilla/firefox/daru/chrome/image" = {
  #     source = "${ffModBlur}/image";
  #   };
  #   ".mozilla/firefox/daru/chrome/old" = {
  #     source = "${ffModBlur}/old";
  #   };
  #   ".mozilla/firefox/daru/chrome/extras" = {
  #     source = "${ffModBlur}/EXTRA MODS";
  #   };
  # };

  # # Fox11 symlinks
  # home.file = {
  #   ".mozilla/firefox/daru/chrome/userChrome.css" = {
  #     source = "${fox11}/userChrome.css";
  #   };
  #   ".mozilla/firefox/daru/chrome/components" = {
  #     source = "${fox11}/components"
  #   };
  # };
  
  # SimpleFox-Feather
  home.file = {
    ".mozilla/firefox/daru/chrome" = {
      source = "${simplefox}/chrome";
      recursive = true;
    };
  };
}
