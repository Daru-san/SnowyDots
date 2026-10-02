{
  wayland.windowManager.hyprland = {
    settings = {
      config = {
        ecosystem.no_update_news = true;
        general = {
          layout = "hy3";
          gaps_in = 1;
          gaps_out = 3;
          border_size = 0;
          allow_tearing = true;
          snap = {
            enabled = true;
          };
        };
        binds = {
          allow_workspace_cycles = false;
          workspace_back_and_forth = true;
        };
        master = {
          mfact = 0.55;
          allow_small_split = true;
        };
        group.groupbar = {
          enabled = true;
          render_titles = false;
          height = 1;
        };
        decoration = {
          rounding = 6;
          blur.enabled = false;
          shadow = {
            enabled = true;
          };
          dim_inactive = true;
          dim_strength = 0.34;
        };
        cursor = {
          inactive_timeout = 30;
          hide_on_key_press = true;
        };
        render = {
          direct_scanout = 1;
          new_render_scheduling = true;
        };
        misc = {
          vrr = 3;
          enable_anr_dialog = false;
          render_unfocused_fps = 0;
          animate_mouse_windowdragging = false;
          enable_swallow = true;
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = true;
          allow_session_lock_restore = true;
        };
      };
      animation = [

        {
          leaf = "windowsIn";
          enabled = true;
          speed = 6;
          bezier = "overshot";
          style = "popin 80%";
        }
        {
          leaf = "windowsOut";
          enabled = true;
          speed = 5;
          bezier = "easeOutExpo";
          style = "popin 80%";
        }
        {
          leaf = "windowsMove";
          enabled = true;
          speed = 5;
          bezier = "overshot";
        }

        {
          leaf = "fadeIn";
          enabled = true;
          speed = 4;
          bezier = "easeOutExpo";
        }
        {
          leaf = "fadeOut";
          enabled = true;
          speed = 4;
          bezier = "easeOutExpo";
        }
        {
          leaf = "fadeSwitch";
          enabled = true;
          speed = 4;
          bezier = "easeOutExpo";
        }
        {
          leaf = "fadeShadow";
          enabled = true;
          speed = 4;
          bezier = "easeOutExpo";
        }
        {
          leaf = "fadeDim";
          enabled = true;
          speed = 4;
          bezier = "easeOutExpo";
        }

        {
          leaf = "border";
          enabled = true;
          speed = 10;
          bezier = "smooth";
        }
        {
          leaf = "borderangle";
          enabled = true;
          speed = 100;
          bezier = "linear";
          style = "loop";
        }

        {
          leaf = "workspaces";
          enabled = true;
          speed = 6;
          bezier = "overshot";
          style = "slidevert";
        }
        {
          leaf = "specialWorkspace";
          enabled = true;
          speed = 6;
          bezier = "overshot";
          style = "slidevert";
        }
      ];
      curve = [
        {
          _args = [
            "smooth"
            {
              type = "bezier";
              points = [
                [
                  0.25
                  0.1
                ]
                [
                  0.25
                  1
                ]
              ];
            }
          ];
        }
        {
          _args = [
            "overshot"
            {
              type = "bezier";
              points = [
                [
                  0.13
                  0.99
                ]
                [
                  0.29
                  1.15
                ]
              ];
            }
          ];
        }
        {
          _args = [
            "easeInOutQuart"
            {
              type = "bezier";
              points = [
                [
                  0.76
                  0
                ]
                [
                  0.24
                  1
                ]
              ];
            }
          ];
        }
        {
          _args = [
            "easeOutExpo"
            {
              type = "bezier";
              points = [
                [
                  0.16
                  1
                ]
                [
                  0.3
                  1
                ]
              ];
            }
          ];
        }
        {
          _args = [
            "easeOutQuint"
            {
              type = "bezier";
              points = [
                [
                  0.22
                  1
                ]
                [
                  0.36
                  1
                ]
              ];
            }
          ];
        }
        {
          _args = [
            "linear"
            {
              type = "bezier";
              points = [
                [
                  0
                  0
                ]
                [
                  1
                  1
                ]
              ];
            }
          ];
        }
      ];
    };
  };
}
