{
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hycov.packages.${system}.hycov
      inputs.hy3.packages.${system}.hy3
    ];
    settings.plugin = {
      hycov = {
        overview_gappo = 60;
        overview_gappi = 24;
        enable_hotarea = 1;
        enable_click_action = 1;
        hotarea_monitor = "all";
        hotarea_pos = 1;
        hotarea_size = 10;
        swipe_fingers = 4;
        move_focus_distance = 100;
        enable_gesture = 1;
        auto_exit = 1;
        auto_fullscreen = 0;
        only_active_workspace = 1;
        only_active_monitor = 1;
        enable_alt_release_exit = 0;
        alt_replace_key = "Alt_L";
        alt_toggle_auto_next = 0;
        click_in_cursor = 1;
        hight_of_titlebar = 0;
        show_special = 0;
      };
      hy3 = {
        no_gaps_when_only = 0;
        node_collapse_policy = 2;

        # offset from group split direction when only one window is in a group
        group_inset = 10; # default: 10

        tab_first_window = true;

        tabs = {
          height = 15; # default: 15

          padding = 5; # default: 5

          # the tab bar should animate in/out from the top instead of below the window
          from_top = false; # default: false

          # rounding of tab bar corners
          rounding = 3; # default: 3

          # render the window title on the bar
          render_text = false; # default: true

          # center the window title
          text_center = true; # default: false

          # font to render the window title with
          text_font = "JetbrainsMono Nerd Font"; # default: Sans

          text_height = 8;
          text_padding = 3;

          # col.active
          # col.urgent
          # col.inactive =
          # col.text.active =
          # col.text.urgent =
          # col.text.inactive =
        };

        autotile = {
          enable = true;

          trigger_width = 0;

          trigger_height = 0;

          workspaces = "all";
        };
      };
    };
  };
}
