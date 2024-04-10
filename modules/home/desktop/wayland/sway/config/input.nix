{
  wayland.windowManager.sway = {
    config = {
      input = {
        "*" = {
          xkb_variant = "us";
          repeat_delay = "440";
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
      };
    };
  };
}
