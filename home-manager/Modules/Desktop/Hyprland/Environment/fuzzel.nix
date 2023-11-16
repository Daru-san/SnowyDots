{config, ...}:{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${config.programs.kitty.package}/bin/kitty";
        layer = "overlay";
        # anchor = "center";
        font = "Jetbrains Mono Nerd Font";
        width = 56;
        lines = 7;
        icon-theme = "Papirus-Dark";
        tabs = 10;
      };
      border = {
        width = 3;
        radius = 4;
      };
      colors = {
        background = "${config.colorScheme.colors.base07}ff";
        border = "${config.colorScheme.colors.base03}ff";
        selection = "${config.colorScheme.colors.base04}aa";
      };
    };
  };
}
