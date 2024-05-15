{config, ...}: {
  programs.fuzzel = {
    settings = {
      main = {
        inherit (config.wayland.windowManager.sway.config) terminal;
        layer = "overlay";
        # anchor = "center";
        font = config.fonts.monospace.name;
        width = 60;
        lines = 8;
        line-height = 24;
        icon-theme = config.gtk.iconTheme.name;
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
        text = "FFFFFFFF";
      };
    };
  };
}
