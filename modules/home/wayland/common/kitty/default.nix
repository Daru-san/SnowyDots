{
  pkgs,
  lib,
  ...
}:
{
  programs.kitty = {
    #Kitty theme
    themeFile = "wizzy-muted";

    # Shell integration
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    #Settings
    settings = {
      active_tab_font_style = "italic";
      inactive_tab_font_style = "normal";
      tab_bar_edge = "bottom";
      tab_title_template = "{index}: {title}";
      focus_follows_mouse = true;
      active_tab_foreground = "#000";
      active_tab_background = "#73D216";
      inactive_tab_foreground = "#444";
      inactive_tab_background = "#999";

      input_delay = 0;
      repaint_delay = 4;
      window_margin_width = 9;
      term = "kitty";
      placement_strategy = "center";

      hide_window_decorations = true;

      dynamic_background_opacity = true;
      enable_audio_bell = false;
      sync_to_monitor = true;
      mouse_hide_wait = 20;
      cursor_shape = "beam";
      cursor_blink_interval = 1;
      cursor_stop_blinking_after = 15;

      #Scrollback pager
      scrollback_lines = 100000;
      scrollback_pager = lib.getExe (
        pkgs.writeShellScriptBin "kitty-scroll" ''
          nvim --noplugin -c "set signcolumn=no showtabline=0" -c "silent! write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "
        ''
      );
    };
    keybindings =
      let
        c = "ctrl";
        a = "alt";
        g = "goto_tab";
      in
      {
        "${c}+${a}+1" = "${g} 1";
        "${c}+${a}+2" = "${g} 2";
        "${c}+${a}+3" = "${g} 3";
        "${c}+${a}+4" = "${g} 4";
        "${c}+${a}+5" = "${g} 5";
        "${c}+${a}+6" = "${g} 6";
        "${c}+${a}+7" = "${g} 7";
        "${c}+${a}+8" = "${g} 8";
        "${c}+${a}+9" = "${g} 9";
        "${c}+c" = "copy_or_interrupt";
        "${c}+${a}+minus" = "set_background_opacity -0.1";
        "${c}+${a}+plus" = "set_background_opacity +0.1";
      };
  };
}
