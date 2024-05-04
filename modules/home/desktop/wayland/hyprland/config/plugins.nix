{
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      # inputs.hyprfocus.packages.${system}.hyprfocus
      inputs.hyprland-plugins.packages.${system}.hyprexpo
    ];
    extraConfig = ''
      plugin {
        hyprexpo {
          columns = 3
          gap_size = 5
          bg_col = rgb(111111)
          workspace_method = center current
          enable_gesture = true
          gesture_distance = 300
          gesture_positive = true
        }

        hyprfocus {
          enabled = yes
          keyboard_focus_animation = flash
          mouse_focus_animation = flash
          bezier = bezIn, 0.5,0.0,1.0,0.5
          bezier = bezOut, 0.0,0.5,0.5,1.0
          flash {
            flash_opacity = 0.7

            in_bezier = bezIn
            in_speed = 0.5

            out_bezier = bezOut
            out_speed = 3
          }
        }
      }
    '';
  };
}
