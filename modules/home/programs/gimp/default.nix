{ pkgs, ... }:
let
  src = pkgs.fetchFromGitHub {
    owner = "Diolinux";
    repo = "PhotoGIMP";
    rev = "86b3cbc916493136529d7da861ef1fc209ac436b";
    hash = "sha256-bGsNLUOVOWi2znCt+wpC+zizz/ZpW7h0s6svzoG3I0c=";
  };
in
{
  home.packages = [ pkgs.gimp3 ];

  xdg.configFile.photogimp = {
    target = "GIMP/3.0";
    source = "${src}/.config/GIMP/3.0";
    recursive = true;
    force = true;
  };
}
