{
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hycov.packages.${system}.hycov
    ];
    extraConfig = ''
      plugin {
        hycov {
          overview_gappo = 60
          overview_gappi = 24
          enable_hotarea = 1
          enable_click_action = 1
          hotarea_monitor = all
          hotarea_pos = 1
          hotarea_size = 10
          swipe_fingers = 4
          move_focus_distance = 100
          enable_gesture = 1
          auto_exit = 1
          auto_fullscreen = 0
          only_active_workspace = 1
          only_active_monitor = 1
          enable_alt_release_exit = 0
          alt_replace_key = Alt_L
          alt_toggle_auto_next = 0
          click_in_cursor = 1
          hight_of_titlebar = 0
          show_special = 0
        }
        # hyprfocus {
        #   enabled = yes
        #   keyboard_focus_animation = flash
        #   mouse_focus_animation = flash
        #   bezier = bezIn, 0.5,0.0,1.0,0.5
        #   bezier = bezOut, 0.0,0.5,0.5,1.0
        #   flash {
        #     flash_opacity = 0.7
        #
        #     in_bezier = bezIn
        #     in_speed = 0.5
        #
        #     out_bezier = bezOut
        #     out_speed = 3
        #   }
        # }
      }
    '';
  };
}
