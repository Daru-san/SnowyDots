{ inputs, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hycov.packages.${pkgs.system}.hycov
      inputs.hyprfocus.packages.${pkgs.system}.hyprfocus
    ];
    extraConfig = ''
      plugin {
        hycov {
          overview_gappo = 60 #gaps width from screen
          overview_gappi = 24 #gaps width from clients
          hotarea_size = 10 #hotarea size in bottom left,10x10
          enable_hotarea = 1 # enable mouse cursor hotarea
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

          shrink {
            shrink_percentage = 0.8

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
