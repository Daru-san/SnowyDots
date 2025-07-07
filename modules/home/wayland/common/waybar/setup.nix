{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  main-bar = {
    layer = "top";
    position = "top";
    height = 30;
    modules-left = [
      "idle_inhibitor"
      (mkIf (config.programs.niri.enable or false) "niri/workspaces")
      (mkIf (config.wayland.windowManager.sway.enable or false) "sway/workspaces")
      (mkIf (config.wayland.windowManager.hyprland.enable or false) "hyprland/workspaces")
      "group/music"
    ];

    modules-center = [
      "clock"
    ];

    modules-right = [
      "group/audio"
      "tray"
      "group/system"
      "group/network"
      "custom/notification"
    ];

    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
    };

    "sway/workspaces" = {
      format = "{name}";
    };

    "niri/workspaces" = {
      format = "{icon}";
      format-icons = {
        web = "󰈹";
        sys = "󱄅";
        chat = "󰍦";
        media = "";
        docs = "󱔗";
        vm = "";
        files = "";
        content = "󱦹";
        dev = "";
        misc = "";
        default = "";
      };
    };

    clock = {
      interval = 1;
      format = "{:%A, %d %B [%X]}";
    };

    "mpris#icon" = {
      format = " {status_icon}";
      status-icons = {
        playing = "";
        paused = "";
        stopped = "";
      };
    };

    "mpris#widget" = {
      format = " {dynamic}";
      format-paused = " <i>{dynamic}</i>";
      dynamic-order = [
        "title"
        "artist"
        "album"
      ];
      dynamic-importance-order = [
        "title"
        "artist"
        "album"
      ];
      dynamic-len = 30;
      tooltip-format = "Player: {player}";
    };

    cava = {
      framerate = 30;
      autosens = 1;
      sensitivity = 3;
      bars = 14;
      lower_cutoff_freq = 50;
      higher_cutoff_freq = 10000;
      method = "pulse";
      source = "auto";
      stereo = false;
      reverse = false;
      bar_delimiter = 0;
      monstercat = false;
      waves = false;
      noise_reduction = 0.77;
      input_delay = 2;
      format-icons = [
        "▁"
        "▂"
        "▃"
        "▄"
        "▅"
        "▆"
        "▇"
        "█"
      ];
      actions = {
        on-click-right = "mode";
      };
    };

    "group/music" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 500;
        children-class = "music-stuff";
      };
      modules = [
        "cava"
        "mpris#icon"
        "mpris#widget"
      ];
    };

    cpu = {
      interval = 2;
      format = "  {usage}%";
    };

    memory = {
      interval = 10;
      format = "  {used:0.1f}GiB/{total:0.1f}GiB";
      tooltip-format = "{percentage}%";
    };

    "group/system" = {
      orientation = "horizontal";
      drawer = false;
      modules = [
        "cpu"
        "memory"
      ];
    };

    network = {
      format = "{ifname}";
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰈀  Ethernet";
      format-disconnected = "󱚵  Disconnected";
      tooltip-format = "{ifname} via {gwaddr} 󰈀";
      tooltip-format-wifi = "Connected to {essid}";
      tooltip-format-ethernet = "{ifname} 󰈀";
      tooltip-format-disconnected = "Disconnected";
    };

    bluetooth = {
      format = " {status}";
      format-connected = " {device_alias}";
      format-connected-battery = " {device_alias} {device_battery_percentage}%";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    };

    "group/network" = {
      orientation = "horizontal";
      drawer = false;
      modules = [
        "network"
        "bluetooth"
      ];
    };

    pulseaudio = {
      format = "{icon}  {volume}% ";
      format-bluetooth = " {icon} {volume}%";
      format-muted = "";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        phone-muted = "";
        portable = "";
        car = "";
        default = [
          ""
          ""
        ];
      };
      scroll-step = 1;
      ignored-sinks = [ "Easy Effects Sink" ];
    };

    "group/audio" = {
      orientation = "horizontal";
      drawer = false;
      modules = [
        "pulseaudio"
        "pulseaudio/slider"
      ];
    };

    "custom/notification" =
      let
        swaync-client = lib.getExe' config.services.swaync.package "swaync-client";
      in
      {
        tooltip = false;
        format = "{icon} ";
        format-icons = {
          notification = "<span foreground='red'><sup></sup></span>";
          none = "";
          dnd-notification = "<span foreground='red'><sup></sup></span>";
          dnd-none = "";
          inhibited-notification = "<span foreground='red'><sup></sup></span>";
          inhibited-none = "";
          dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
          dnd-inhibited-none = "";
        };
        return-type = "json";
        exec = "${swaync-client} -swb";
        on-click = "${swaync-client} -t -sw";
        on-click-right = "${swaync-client} -d -sw";
        escape = true;
      };
  };
}
