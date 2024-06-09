{config, ...}: {
  programs.fuzzel = {
    settings = {
      main = {
        inherit (config.wayland.windowManager.sway.config) terminal;
        layer = "overlay";
        # anchor = "center";
        font = config.fonts.monospace.name + ":size=18";
        width = 70;
        lines = 7;
        line-height = 24;
        icon-theme = config.gtk.iconTheme.name;
        tabs = 10;
      };
      border = {
        width = 1;
        radius = 4;
      };
      colors = let
        color = x: "${config.colorScheme.palette.${x}}FF";
      in {
        background = color "base01";
        border = color "base0B";
        selection = color "base0D";
        text = color "base05";
      };
    };
  };
}
