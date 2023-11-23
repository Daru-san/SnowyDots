{config, ...}:{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${config.programs.kitty.package}/bin/kitty";
        layer = "overlay";
        # anchor = "center";
        font = "Jetbrains Mono Nerd Font";
        width = 60;
        lines = 8;
	line-height = 24;
        icon-theme = "Papirus-Dark";
        tabs = 10;

      };
      border = {
        width = 3;
        radius = 4;
      };
      colors = {
        background = "1E2127FF";
        border = "2F343FFF";
        selection = "7FBBB3FF";
	text = "FFFFFF";
      };
    };
  };
}
