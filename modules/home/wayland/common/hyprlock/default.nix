{
  config,
  pkgs,
  lib,
  ...
}:
let
  color = color: config.stylix.generated.palette.${color};
  get-music = pkgs.writeShellScript "get-music" ''
    song_info=$(${lib.getExe pkgs.playerctl} metadata --format '{{title}}      {{artist}}')
    echo "$song_info"
  '';
  date = lib.getExe' pkgs.uutils-coreutils-noprefix "date";
in
{
  stylix.targets.hyprlock.enable = false;
  programs.hyprlock = {
    settings = {
      general = {
        grace = 5;
        hide_cursor = true;
      };
      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint";
        };
      };
      background = {
        color = "rgb(${color "base00"})";
        path = "${config.stylix.image}";
      };
      input-field = {
        outer_color = "rgb(${color "base03"})";
        inner_color = "rgb(${color "base00"})";
        font_color = "rgb(${color "base05"})";
        fail_color = "rgb(${color "base08"})";
        check_color = "rgb(${color "base0A"})";
        size = "350, 40";
        position = "30, -125";
        dots_center = true;
        fade_on_empty = false;
        rounding = 0;
        font_family = "Rubik";
        placeholder_text = "パスワードを入力してください";
        halign = "center";
        valign = "center";
      };
      label = [
        {
          text = ''cmd[update:1000] echo -e "$(${date} +"%A, %B %d")"'';
          color = "rgba(${color "base08"}, .65)";
          font_size = 22;
          font_family = "Rubik";
          position = "0, 120";
          halign = "center";
          valign = "center";
        }
        {
          text = ''cmd[update:1000] echo "<span>$(${date} +"%X")</span>"'';
          color = "rgba(${color "base08"}, .65)";
          font_size = 90;
          font_family = "Rubik";
          position = "0, 50";
          halign = "center";
          valign = "center";
        }
        {
          text = ''cmd[update:1000] echo "$(${get-music})"'';
          color = "rgba(${color "base00"}, .55)";
          font_size = 17;
          font_family = "JetBrains Mono Nerd, Rubik";
          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
