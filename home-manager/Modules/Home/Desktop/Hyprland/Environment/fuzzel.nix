{config, ...}:{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${config.programs.kitty.package}/bin/kitty";
        layer = "overlay";
        anchor = "center";
        font = "Jetbrains Mono Nerd Font";
      };
      colors = {
        background = "${config.colorScheme.colors.base05}ff";
        border = "${config.colorScheme.colors.base03}ff";
        selection = "${config.colorScheme.colors.base04}aa";
      };
    };
  };
}
