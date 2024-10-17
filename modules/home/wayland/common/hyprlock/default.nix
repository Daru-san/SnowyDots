{
  config,
  pkgs,
  lib,
  ...
}:
let
  font = "NotoMono Nerd Font";
  now-playing = pkgs.writeShellScriptBin "now-playing" ''
    songstats=$(${lib.getExe pkgs.playerctl} metadata --format '󰎈 {{title}} - {{artist}} 󰎈')
    ${lib.getExe' pkgs.coreutils "echo"} "$songstats"
  '';

in
{
  programs.hyprlock = {
    settings = {
      general = {
        grace = 5;
        hide_cursor = true;
      };
      background = [
        {
          path = toString config.wallpaperImage;
          blur_size = 5;
          blur_passes = 1;
        }
      ];
      input-field = [
        {
          size = "220, 50";
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.5)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          position = "0, -185";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        {
          text = ''cmd[update:1000] ${lib.getExe' pkgs.coreutils "date"} +"%X"'';
          font_size = 90;
          font_family = font;
          position = "0, -120";
          halign = "center";
          valign = "top";
        }
        {
          text = ''cmd[update 1000] ${lib.getExe' pkgs.coreutils "date"} +"%A, %d %B %Y"'';
          font_size = 20;
          font_family = font;
          position = "0, -250";
          halign = "center";
          valign = "top";
        }
        {
          text = ''Welcome, $USER'';
          font_size = 16;
          font_family = font;
          position = "0, -140";
          halign = "center";
          valign = "center";
        }
        {
          text = ''cmd[update 1000] ${lib.getExe now-playing}'';
          font_size = 16;
          font_family = font;
          position = "0, -60";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
