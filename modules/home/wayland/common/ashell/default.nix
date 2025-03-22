{ pkgs, lib, ... }:
let
  yaml = pkgs.formats.yaml { };
in
{
  home.packages = [ pkgs.ashell ];
  xdg.configFile.ashell = {
    target = "ashell.yml";
    source = yaml.generate "ashell.yml" {
      logLevel = "WARN";
      outputs = "All";
      position = "bottom";
      workspaces = {
        visibilityMode = "All";
      };
      clock = {
        format = "%a %d %b %X";
      };
      modules = {
        left = [
          "Workspaces"
          "MediaPlayer"
        ];
        center = [ "WindowTitle" ];
        right = [
          "SystemInfo"
          "Tray"
          ''[Clock, Privacy, Settings]''
        ];
      };
    };
  };
}
