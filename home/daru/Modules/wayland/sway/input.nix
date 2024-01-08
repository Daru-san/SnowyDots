{...}:{
  wayland.windowManager.sway = {
    config = {
      input = {
        keyboard = {
          xkb_variant = "us";
          repeat_delay = "300";
          repeat_rate = "50";
        };
        touchpad = {
          natural_scroll = "enabled";
          dwt = "enabled";
          drag_lock = "enabled";
          drag = "enabled";
          tap = "enabled";
          scroll_method = "two_finger";
          click_method = "clickfinger";
        };
        "2.4g-mouse" = {
          natural_scroll = "enabled";
          pointer_accel = "0.5";
          accel_profile = "adaptive";
        };
      };
    };
  };
}
