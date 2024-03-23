{config, ...}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-keephue = true;
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
    extraConfig = with config.colorScheme.palette; ''
      set notification-error-bg       "#${base03}" #525252
      set notification-error-fg       "#${base0A}" #ee5396
      set notification-warning-bg     "#${base03}" #525252
      set notification-warning-fg     "#${base0A}" #ee5398
      set notification-bg             "#${base03}" #525252
      set notification-fg             "#${base08}" #3ddbd9

      set completion-group-bg         "#${base09}" #78a9ff
      set completion-group-fg         "#${base01}" #262626
      set completion-bg               "#${base09}" #78a9ff
      set completion-fg               "#${base01}" #262626
      set completion-highlight-bg     "#${base03}" #525252
      set completion-highlight-fg     "#${base0B}" #33b1ff

      # Define the color in index mode
      set index-bg                   "#${base09}" #78a9ff
      set index-fg                   "#${base04}" #dde1e6
      set index-active-bg             "#${base0B}" #33b1ff
      set index-active-fg             "#${base04}" #dde1e6

      set inputbar-bg                 "#${base02}" #262626
      set inputbar-fg                 "#${base04}" #dde1e6

      set statusbar-bg                "#${base02}" #262626
      set statusbar-fg                "#${base04}" #dde1e6

      set highlight-color             "#${base0F}" #82cfff
      set highlight-active-color      "#${base0B}" #33b1ff

      set default-bg                  "#${base00}" #161616
      set default-fg                  "#${base05}" #f2f4f8

      set recolor-lightcolor          "#${base00}" #161616
      set recolor-darkcolor           "#${base05}" #f2f4f8
    '';
  };
}
