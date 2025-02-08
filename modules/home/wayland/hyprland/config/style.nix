{
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        gaps_in = 1;
        gaps_out = 3;
        border_size = 0;
      };
      binds = {
        allow_workspace_cycles = true;
        workspace_back_and_forth = true;
      };
      master = {
        mfact = 0.55;
        allow_small_split = true;
      };
      group.groupbar.enabled = false;
      decoration = {
        rounding = 6;
        blur.enabled = true;
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
      misc = {
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
          "workspaces, 1, 2, default, fade"
        ];
      };
    };
  };
}
