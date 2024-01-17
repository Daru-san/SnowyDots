{pkgs, lib, ...}: {
  programs.kitty = {
    enable = true;

    #Kitty theme
    theme = "Wryan";

    #Kitty font
    font = {
      name = "Jetbrains Mono Nerd Font";
      size = 14;
    };
    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
    };

    #Settings
    settings = {
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      tab_activity_symbol = "󰗖 ";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "italics";
      input_delay = 1;
      repaint_delay = 7;
      window_margin_width = 8;
      window_margin_height = 6;
      term = "kitty";
      placement_strategy ="center";

      hide_window_decorations = true;

      background_opacity = "0.44";
      dynamic_background_opacity = true;

      sync_to_monitor = true;
      mouse_hide_wait = 20;
      cursor_shape = "beam";
      cursor_blink_interval = 1;
      cursor_stop_blinking_after = 15;

      #Scrollback pager
      scrollback_lines = 100000;
      scrollback_pager = "kitty-scroll";
    };
    keybindings = let
       c = "ctrl";
       a = "alt";
       g = "goto_tab";
    in { 
      "${c}+c" = "copy_or_interrupt";
      "${c}+${a}+1" = "${g} 1";
      "${c}+${a}+2" = "${g} 2";
      "${c}+${a}+3" = "${g} 3";
      "${c}+${a}+4" = "${g} 4";
      "${c}+${a}+5" = "${g} 5";
      "${c}+${a}+6" = "${g} 6";
      "${c}+${a}+7" = "${g} 7";
      "${c}+${a}+8" = "${g} 8";
      "${c}+${a}+9" = "${g} 9";
      "${c}+${a}+minus" = "set_background_opacity -0.1";
      "${c}+${a}+plus" = "set_background_opacity +0.1";
    };
  };

#Script for scrollback pager
  home.packages = with pkgs; [
        (pkgs.writeShellScriptBin "kitty-scroll" ''
         nvim --noplugin -c "set signcolumn=no showtabline=0" -c "silent! write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "
     '')
  ];

  #Autostart session files
  home.file.".config/kitty/git.conf".text = ''
    new_tab SnowyUI
    title GitUI
    cd ~/snow
    launch gitui

    new_tab Snowfiles
    title Ranger
    cd ~/snow
    launch ranger

    new_tab Snowcli
    title zsh
    cd ~/snow
    launch zsh
  '';
}
