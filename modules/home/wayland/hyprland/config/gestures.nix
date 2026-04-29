{
  wayland.windowManager.hyprland = {
    settings.gesture = [
      "3, vertical, workspace"
      "3, up, mod: ALT, scale: 1.5, dispatcher, movetoworkspace, r-1"
      "3, down, mod: ALT, scale: 1.5, dispatcher, movetoworkspace, r+1"
      "3, left, dispatcher, hy3:focustab, l"
      "3, right, dispatcher, hy3:focustab, r"
      "3, left, mod: ALT, dispatcher, hy3:movewindow, l, once, visible"
      "3, right, mod: ALT, dispatcher, hy3:movewindow, r, once, visible"
      "2, pinch, mod: ALT, resize"
    ];
  };
}
