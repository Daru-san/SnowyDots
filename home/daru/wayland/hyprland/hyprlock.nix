{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  greeter = with pkgs;
    writeShellScriptBin "cli-greeter" ''
      h=`date +%H`

      if [ $h -lt 12 ]; then
        echo Good morning $USER
      elif [ $h -lt 18 ]; then
        echo Good afternoon $USER
      else
        echo Good evening $USER
      fi
    '';
  now-playing = with pkgs;
    writeShellScriptBin "now-playing" ''
      now-playing=$(playerctl metadata --format '󰎈{{title}} - {{artist}}󰎈')
      echo "$now-playing"
    '';
in {
  imports = [inputs.hyprlock.homeManagerModules.default];
  programs.hyprlock = {
    enable = true;
    general = {
      grace = 5;
      hide_cursor = true;
    };
    backgrounds = [
      {
        path = "${config.theme.wallpaper.image}";
        blur_size = 9;
      }
    ];
    input-fields = [
      {
        size = {
          width = 270;
          height = 70;
        };
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
        position = {
          x = 0;
          y = -120;
        };
        halign = "center";
        valign = "center";
      }
    ];
    labels = [
      {
        text = ''cmd[update:1000] date +"%X"'';
        font_size = 64;
        font_family = "JetBrains Mono Nerd Font 10";
        position = {
          x = 0;
          y = -300;
        };
        halign = "center";
        valign = "center";
      }
      {
        text = ''cmd[update:1000] ${lib.getExe greeter}'';
        font_size = 20;
        font_family = "JetBrains Mono Nerd Font 10";
        position = {
          x = 0;
          y = 0;
        };
        halign = "center";
        valign = "center";
      }
      {
        text = ''cmd[update 1000] ${lib.getExe now-playing}'';
        font_size = 16;
        font_family = "JetBrains Mono Nerd Font 10";
        position = {
          x = 0;
          y = 30;
        };
        halign = "center";
        valign = "bottom";
      }
    ];
  };
}
