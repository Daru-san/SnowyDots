{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;

    #Kitty theme
    theme = "Wizzy Muted";

    # Shell integration
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    # Kitty font
    font = {
      inherit (config.fonts.monospace) package name;
      size = config.fonts.sizes.terminal;
    };

    #Settings
    settings = {
      active_tab_font_style = "bold";
      inactive_tab_font_style = "italics";
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      input_delay = 0;
      repaint_delay = 4;
      window_margin_width = 9;
      window_margin_height = 9;
      term = "kitty";
      placement_strategy = "center";

      hide_window_decorations = true;

      background_opacity = "0.6";
      dynamic_background_opacity = true;

      sync_to_monitor = true;
      mouse_hide_wait = 20;
      cursor_shape = "beam";
      cursor_blink_interval = 1;
      cursor_stop_blinking_after = 15;

      #Scrollback pager
      scrollback_lines = 100000;
      scrollback_pager = lib.getExe (pkgs.writeShellScriptBin "kitty-scroll" ''
        nvim --noplugin -c "set signcolumn=no showtabline=0" -c "silent! write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "
      '');
    };
    keybindings = let
      c = "ctrl";
      a = "alt";
    in {
      "${c}+c" = "copy_or_interrupt";
      "${c}+${a}+minus" = "set_background_opacity -0.1";
      "${c}+${a}+plus" = "set_background_opacity +0.1";
    };
  };
}
