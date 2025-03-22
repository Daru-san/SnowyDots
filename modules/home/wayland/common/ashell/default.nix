{ pkgs, lib, ... }:
let
  yaml = pkgs.formats.yaml { };
in
{
  home.packages = [ pkgs.ashell ];
  xdg.configFile.ashell = {
    target = "ashell.yml";
    source = ./ashell.yml;
  };
}
