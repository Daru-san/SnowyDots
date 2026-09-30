{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia = {
    package = pkgs.noctalia;
    systemd.enable = true;

    settings = {
      "bar" = {
        "widgets" = {
          "border" = "surface";
          "capsule_group" = [
            {
              "accordion" = false;
              "accordion_direction" = "end";
              "enabled" = true;
              "fill" = "surface_variant";
              "id" = "g1";
              "members" = [
                "sysmon"
                "cpu"
                "temp"
                "ram"
              ];
              "opacity" = 1.0;
              "padding" = 6.0;
            }
            {
              "accordion" = false;
              "accordion_direction" = "end";
              "enabled" = true;
              "fill" = "surface_variant";
              "id" = "g2";
              "members" = [
                "network"
                "bluetooth"
              ];
              "opacity" = 1.0;
              "padding" = 6.0;
            }
            {
              "accordion" = false;
              "accordion_direction" = "end";
              "enabled" = true;
              "fill" = "surface_variant";
              "id" = "g3";
              "members" = [
                "brightness"
                "volume"
                "battery"
              ];
              "opacity" = 1.0;
              "padding" = 6.0;
            }
            {
              "accordion" = false;
              "accordion_direction" = "end";
              "enabled" = true;
              "fill" = "surface_variant";
              "id" = "g4";
              "members" = [
                "clock"
              ];
              "opacity" = 1.0;
              "padding" = 6.0;
            }
            {
              "accordion" = false;
              "accordion_direction" = "end";
              "enabled" = true;
              "fill" = "surface_variant";
              "id" = "g5";
              "members" = [
                "network_tx"
                "network_rx"
              ];
              "opacity" = 1.0;
              "padding" = 6.0;
            }
            {
              "accordion" = false;
              "accordion_direction" = "end";
              "enabled" = true;
              "fill" = "surface_variant";
              "id" = "g6";
              "members" = [
                "media"
                "audio_visualizer"
              ];
              "opacity" = 1.0;
              "padding" = 6.0;
            }
            {
              "accordion" = false;
              "accordion_direction" = "end";
              "enabled" = true;
              "fill" = "surface_variant";
              "id" = "g7";
              "members" = [
                "notifications"
                "caffeine"
                "tray"
              ];
              "opacity" = 1.0;
              "padding" = 6.0;
            }
          ];
          "center" = [
            "group:g4"
            "group:g7"
          ];
          "end" = [
            "group:g1"
            "group:g2"
            "group:g5"
            "group:g3"
          ];
          "font_scale" = 1.0399999842047691;
          "margin_ends" = 0;
          "scale" = 0.9500000067055225;
          "start" = [
            "workspaces"
            "group:g6"
          ];
          "thickness" = 30;
        };
      };
      "config_version" = 14;
      "desktop_widgets" = {
        "enabled" = false;
      };
      "idle" = {
        "behavior" = {
          "lock" = {
            "action" = "lock";
            "enabled" = true;
            "timeout" = 3000.0;
          };
          "lock-and-suspend" = {
            "action" = "lock_and_suspend";
            "enabled" = true;
            "timeout" = 6000.0;
          };
          "screen-off" = {
            "action" = "screen_off";
            "enabled" = true;
            "timeout" = 600.0;
          };
        };
        "behavior_order" = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
      };
      "location" = {
        "auto_locate" = true;
      };
      "lockscreen" = {
        "transition" = [
          "fade"
        ];
      };
      "lockscreen_widgets" = {
        "enabled" = false;
        "grid" = {
          "cell_size" = 16;
          "major_interval" = 4;
          "visible" = true;
        };
        "schema_version" = 2;
        "widget" = {
          "lockscreen-login-box@eDP-1" = {
            "box_height" = 196.0;
            "box_width" = 810.0;
            "cx" = 683.0;
            "cy" = 586.0;
            "output" = "eDP-1";
            "placement_height" = 768.0;
            "placement_width" = 1366.0;
            "rotation" = 0.0;
            "settings" = {
              "background_color" = "surface_variant";
              "background_opacity" = 0.88;
              "background_radius" = 12.0;
              "center_password_text" = false;
              "input_opacity" = 1.0;
              "input_radius" = 6.0;
              "layout" = "regular";
              "show_caps_lock" = true;
              "show_keyboard_layout" = true;
              "show_login_button" = true;
              "show_media" = true;
              "show_session_buttons" = true;
              "show_unlock_hint" = true;
              "show_weather" = true;
            };
            "type" = "login_box";
          };
        };
        "widget_order" = [
          "lockscreen-login-box@eDP-1"
        ];
      };
      "shell" = {
        "screen_corners" = {
          "enabled" = true;
        };
        "screen_time_enabled" = true;
      };
      "theme" = {
        "pure_black_dark" = true;
      };
      "widget" = {
        "audio_visualizer" = {
          "mirrored" = false;
          "show_when_idle" = true;
        };
        "battery" = {
          "capsule" = true;
          "show_label" = false;
        };
        "brightness" = {
          "show_label" = false;
        };
        "clock" = {
          "capsule" = true;
          "format" = "{:%a %e - %H:%M}";
        };
        "cpu" = {
          "stat" = "cpu_freq";
        };
        "media" = {
          "anchor" = true;
          "capsule" = true;
          "show_progress" = true;
          "title_scroll" = "always";
        };
        "network" = {
          "show_label" = false;
        };
        "network_rx" = {
          "network_speed_compact" = true;
          "visualization" = "none";
        };
        "network_tx" = {
          "network_speed_compact" = true;
          "visualization" = "none";
        };
        "sysmon" = {
          "visualization" = "none";
        };
        "tray" = {
          "detached_panel" = true;
          "drawer" = true;
          "hide_passive" = false;
        };
        "volume" = {
          "show_label" = false;
        };
        "workspaces" = {
          "anchor" = true;
          "label_source" = "name";
          "labels_only_when_occupied" = true;
          "style" = "focus_hint";
        };
      };
    };
  };
}
