{
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        gaps_in = 1;
        gaps_out = 1;
        border_size = 0;
        layout = "master";
      };
      binds = {
        allow_workspace_cycles = true;
        workspace_back_and_forth = true;
      };
      master = {
        new_is_master = false;
        mfact = 0.55;
        allow_small_split = true;
        no_gaps_when_only = false;
      };
      group.groupbar.enabled = false;
      decoration = {
        rounding = 6;
        blur.enabled = true;
        drop_shadow = false;
        shadow_range = 7;
        shadow_render_power = 6;
        dim_inactive = true;
        dim_strength = 0.34;
      };
      cursor = {
        inactive_timeout = 30;
      };
      misc = {
        vrr = 1;
        vfr = true;
        animate_mouse_windowdragging = false;
        enable_swallow = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        allow_session_lock_restore = true;
      };
      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 2, default, slide"
        ];
      };
    };
  };
}
