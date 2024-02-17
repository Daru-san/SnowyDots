{config, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        gaps_in = 6;
        gaps_out = 9;
        border_size = 2.7;
        cursor_inactive_timeout = 30;
        layout = "master";
      };
      master = {
        new_is_master = false;
        mfact = 0.55;
        allow_small_split = true;
        no_gaps_when_only = false;
      };
      decoration = {
        rounding = 14;
        blur = {
          enabled = true;
          size = 7;
          passes = 1;
          ignore_opacity = true;
          new_optimizations = true;
        };
        drop_shadow = true;
        shadow_range = 7;
        shadow_render_power = 6;
        # active_opacity = 0.97;
        # inactive_opacity = 0.9;
        dim_inactive = true;
        dim_strength = 0.34;
      };
      misc = {
        vrr = 1;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
      };
      animations = {
        enabled = true;
        bezier = [
          "linear, 0.0, 0.0, 1.0, 1.0"
          "def, 0.05, 0.9, 0.1, 1.05"
          "myBezier, 0.1, 0.6, 0.1, 1.05"
          "easeOutBack, 0.34, 1.56, 0.64, 1"
          "easeInOutBack, 0.68, -0.6, 0.32, 1.6"
          "easeInExpo, 0.7, 0, 0.84, 0"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeInOutQuad, 0.45, 0, 0.55, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
        ];
        animation = [
          "workspaces, 1, 8, myBezier, slidefadevert"
          "borderangle, 1, 100, linear, loop"
          "windowsOut, 1, 5, easeInOutBack, popin 80%"
          "windowsIn, 1 ,8, myBezier, popin 20%"
          "border ,1, 10, easeOutBack"
          "fade, 1, 7, myBezier"
        ];
      };
      layerrule = let
        b = regex: "blur,${regex}";
        z = regex: "ignorezero,${regex}";
      in [(z "waybar") (b "waybar")];
    };
  };
}
