{
  wayland.windowManager.hyprland = {
    settings = {
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
      animations = {
        enabled = true;
        bezier = [
          "smooth, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 5, smooth, slidefadevert 20%"
        ];
      };
    };
  };
}
