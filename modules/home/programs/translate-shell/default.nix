{
  pkgs,
  lib,
  ...
}:
{
  programs.translate-shell = {
    enable = true;
    settings = {
      hl = "en";
      tl = [
        "afr"
        "ja"
        "zu"
      ];
      view = true;
      show-original-dictionary = true;
      show-alternatives = true;
      pager = lib.getExe pkgs.bat;
      verbose = true;
    };
  };
}
