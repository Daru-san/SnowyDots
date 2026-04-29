{
  programs.sioyek = {
    enable = true;
    config = {
      startup_commands = [
        "toggle_visual_scroll"
        "toggle_dark_mode"
      ];
    };
  };
}
