{
  pkgs,
  lib,
  config,
  ...
}: let
  theme = with builtins;
    readFile (pkgs.fetchFromGitHub {
        owner = "hbjydev";
        repo = "oxocarbon-kitty";
        rev = "d012fc5002c801949808679ad1f476e4ffb8209e";
        hash = "sha256-vjyalOp3kfHpIeHiLScxW2sLhwVg8c6WnNKlarwkzjs=";
      }
      + "/skin.conf");
in {
  programs.kitty = {
    enable = true;

    #Kitty theme
    extraConfig = theme;

    # Shell integration
    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
    };

    # Kitty font
    font = {
      inherit (config.fonts.monospace) package name;
      size = config.fonts.sizes.terminal;
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
      placement_strategy = "center";

      hide_window_decorations = true;

      background_opacity = "1";
      dynamic_background_opacity = true;

      sync_to_monitor = true;
      mouse_hide_wait = 20;
      cursor_shape = "beam";
      cursor_blink_interval = 1;
      cursor_stop_blinking_after = 15;

      #Scrollback pager
      scrollback_lines = 100000;
      scrollback_pager = "${with lib; getExe pkgs.bat} --pager=always";
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
    title SnowyDots

    new_tab LazyFlake
    cd ~/snow
    launch lazygit

    new_tab ChilledEditor
    cd ~/snow
    launch vi
  '';
  xdg.configFile."kitty/musikcube.conf".text = ''
    new_tab musikcube
    title musikcube
    launch musikcube
  '';
}
