{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [pyprland];
  xdg.configFile."hypr/pyprland.toml".source = with pkgs;
    (formats.toml { }).generate "pyprland.toml" {
      pyprland = {
        plugins = ["scratchpads" "toggle_special"];
      };
      scratchpads = {
        term = {
          animation = "fromTop";
          command = "kitty --class kitty-dropterm";
          class = "kitty-dropterm";
          size = "70% 60%";
          max_size = "80% 70%";
          margin = 50;
        };
        volume = {
          animation = "fromRight";
          command = "pavucontrol";
          class = "pavucontrol";
          size = "40% 90%";
          unfocus = "hide";
          hysteresis = 0.7;
        };
        easyeffects = {
          animation = "fromRight";
          command = "easyeffects";
          class = "com.github.wwmm.easyeffects";
          size = "40% 90%";
        };
        valent = {
          animation = "fromRight";
          command = "valent";
          class = "valent";
          size = "60% 80%";
          unfocus = "hide";
          lazy = true;
        };
        bluetooth = {
          animation = "fromRight";
          command = "overskride";
          class = "io.github.kaii_lb.Overskride";
          size = "70% 70%";
          lazy = true;
        };
        passwords = {
          animation = "fromBottom";
          command = "keepassxc";
          class = "KeePassXC";
          size = "80% 80%";
          lazy = true;
          excludes = ["*"];
        };
        btop = {
          animation = "fromBottom";
          command = "kitty --class btop --hold btop";
          class = "btop";
          size = "70% 70%";
        };
        blueman = {
          animation = "fromRight";
          command = "blueman-manager";
          class = ".blueman-manager-wrapped";
          size = "40% 40%";
        };
      };
    };
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hycov.packages.${pkgs.system}.hycov
      # inputs.hyprfocus.packages.${pkgs.system}.hyprfocus
    ];
    extraConfig = ''
      plugin {
        hycov {
          overview_gappo = 60 #gaps width from screen
          overview_gappi = 24 #gaps width from clients
          hotarea_size = 10 #hotarea size in bottom left,10x10
          enable_hotarea = 1 # enable mouse cursor hotarea
        }
        # hyprfocus {
        #   enabled = yes
        #
        #   keyboard_focus_animation = flash
        #   mouse_focus_animation = flash
        #
        #   bezier = bezIn, 0.5,0.0,1.0,0.5
        #   bezier = bezOut, 0.0,0.5,0.5,1.0
        #
        #   flash {
        #     flash_opacity = 0.7
        #
        #     in_bezier = bezIn
        #     in_speed = 0.5
        #
        #     out_bezier = bezOut
        #     out_speed = 3
        #   }
        #
        #   shrink {
        #     shrink_percentage = 0.8
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
