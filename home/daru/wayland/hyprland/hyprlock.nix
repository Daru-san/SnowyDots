{
  inputs,
  config,
  ...
}: {
  imports = [inputs.hyprlock.homeManagerModules.default];
  programs.hyprlock = {
    enable = true;
    general = {
      grace = 5;
      hide_cursor = true;
    };
    background = [
      {
        path = "${config.theme.wallpaper.image}";
        blur_size = 9;
      }
    ];
    input-fields = [
      {
        size = {
          width = 200;
          height = 50;
        };
        outline_thickness = 3;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = false;
        outer_color = "rgb(151515)";
        inner_color = "rgb(200, 200, 200)";
        font_color = "rgb(10, 10, 10)";
        fade_on_empty = true;
        placeholder_text = "<i>Input Password...</i>";
        hide_input = true;
        position = {
          x = 0;
          y = -20;
        };
        halign = "center";
        valign = "center";
      }
    ];
    labels = [
      {
        text = ''cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"'';
        font_size = 64;
        font_family = "JetBrains Mono Nerd Font 10";
        position = {
          x = 0;
          y = 16;
        };
        halign = "center";
        valign = "center";
      }
      {
        text = ''Hey <span text_transform="capitalize" size="larger">$USER</span>'';
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
        text = "Type to unlock!";
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
