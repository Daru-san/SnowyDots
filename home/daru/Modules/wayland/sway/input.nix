{...}:{
  wayland.windowManager.sway = {
    settings = {
      input = {
        keyboard = {
          xkb_variant = "us";
          repeat_delay = 300;
          repeat_rate = 50;
        };
        touchpad = {
          natural_scroll = true;
          dwt = true;
          drag_lock = true;
          drag = true;
          tap = true;
          scroll_method = "two_finger";
          click_method = "clickfinger";
        };
        "2.4g-mouse" = {
          natural_scroll = false;
          pointer_accel = 0.5;
          accel_profile = "adaptive";
        };
      };
    };
  };
}
