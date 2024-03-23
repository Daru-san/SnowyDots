{config}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-keephue = true;
      recolor-darkcolor = "#b1b1b1";
      font = "${config.fonts.monospace.name} ${toString config.fonts.sizes.terminal}";
      page-padding = 3;
      selection-notification = true;
      selection-clipboard = "clipboard";
      scroll-page-aware = true;
      guioptions = "none";
      sandbox = "strict";
      statusbar-home-tilde = true;
      window-title-basename = true;
    };
  };
}
