{
  programs.alacritty = {
    settings = {
      general.import = [
        #          ./colorsScheme.toml
      ];
      window = {
        opacity = 0.7;
      };
      font = {
        normal = {
          family = "JetbrainsMono NF";
          style = "Regular";
        };
        size = 16;
      };
      selection.save_to_clipboard = true;
      cursor = {
        style = {
          shape = "Block";
          blinking = "on";
        };
        vi_mode_style = {
          shape = "Block";
          blinking = "off";
        };
        blink_timeout = 7;
      };
    };
  };
}
