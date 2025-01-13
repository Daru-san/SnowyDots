{
  main-bar = {
    layer = "top";
    position = "top";
    height = 30;
    # output = [
    #   config.wayland.settings.monitor.main.name
    # ];
    modules-left = [
      "niri/workspaces"
      "niri/window"
    ];
    modules-center = [
      "group/music"
    ];
    modules-right = [
      "tray"
      "group/system"
      "group/network"
      "group/audio"
    ];

    "mpris#icon" = {
      format = "{player_icon} ({status_icon})";
    };

    "mpris#widget" = {
      format = "{dynamic}";
      format-paused = "<i>{dynamic}</i>";
      dynamic-order = [
        "title"
        "artist"
        "album"
      ];
      tooltip-format = "Player: {player}";
    };

    "group/music" = {
      orientation = "horizontal";
      drawer = true;
      modules = [
        "mpris#icon"
        "mpris#widget"
      ];
    };

    "group/system" = {
      orientation = "horizontal";
      drawer = false;
      modules = [
        "cpu"
        "memory"
      ];
    };

    "group/network" = {
      orientation = "horizontal";
      drawer = false;
      modules = [
        "network"
        "bluetooth"
      ];
    };

    "group/audio" = {
      orientation = "horizontal";
      drawer = false;
      modules = [
        "pulseaudio"
        "pulseaudio/slider"
      ];
    };
  };
}
