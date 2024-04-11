{
  programs.polybar = {
    script = "polybar simple &";
    settings = rec {
      colors = {
        background = "#050e14";
        background-alt = "#282A2E";
        foreground = "#C5C8C6";
        primary = "#F07489";
        secondary = "#8ABEB7";
        alert = "#F0C674";
        disabled = "#707880";
      };

      bar.simple = {
        width = "100%";
        height = "24pt";
        radius = 10;

        inherit (colors) background;
        inherit (colors) foreground;

        line-size = "3pt";

        border-size = "6pt";
        border-color = "#00000000";

        padding-left = 1;
        padding-right = 1;

        module-margin = 1;

        separator = "|";
        separator-foreground = colors.disabled;

        font-0 = "JetbrainsMono NF";

        modules-left = ["xworkspaces" "xwindow"];
        modules-right = ["pulseaudio" "memory" "cpu" "wlan" "date"];

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;
        module = {
          xworkspaces = {
            type = "internal/xworkspaces";

            label-active = "%name%";
            label-active-background = colors.background-alt;
            label-active-underline = colors.primary;
            label-active-padding = 1;

            label-occupied = "%name%";
            label-occupied-padding = 1;

            label-urgent = "%name%";
            label-urgent-background = colors.alert;
            label-urgent-padding = 1;

            label-empty = "%name%";
            label-empty-foreground = colors.disabled;
            label-empty-padding = 1;
          };
          xwindow = {
            type = "internal/xwindow";
            label = "%title:0:60:...%";
          };
          filesystem = {
            type = "internal/fs";
            interval = 25;

            mount-0 = "/";

            label-mounted = "%{F#F0C674}%mountpoint%%{F-} %percentage_used%%";

            label-unmounted = "%mountpoint% not mounted";
            label-unmounted-foreground = colors.disabled;
          };
          pulseaudio = {
            type = "internal/pulseaudio";

            format-volume-prefix = "VOL ";
            format-volume-prefix-foreground = colors.primary;
            format-volume = "<label-volume>";

            label-volume = "%percentage%%";

            label-muted = "muted";
            label-muted-foreground = colors.disabled;
          };
          xkeyboard = {
            type = "internal/xkeyboard";
            blacklist-0 = "num lock";

            label-layout = "%layout%";
            label-layout-foreground = colors.primary;

            label-indicator-padding = 2;
            label-indicator-margin = 1;
            label-indicator-foreground = colors.background;
            label-indicator-background = colors.secondary;
          };
          memory = {
            type = "internal/memory";
            interval = 2;
            format-prefix = "RAM ";
            format-prefix-foreground = colors.primary;
            label = "%percentage_used:2%%";
          };
          cpu = {
            type = "internal/cpu";
            interval = 2;
            format-prefix = "CPU ";
            format-prefix-foreground = colors.primary;
            label = "%percentage:2%%";
          };
          wlan = {
            "inherit" = "network-base";
            interface-type = "wireless";
            label-connected = "%{F#F07489}%essid% %{F-}%local_ip%";
          };
          eth = {
            "inherit" = "network-base";
            interface-type = "wired";
            label-connected = "%{F#F07489}%ifname% %{F-}%local_ip%";
          };
          date = {
            type = "internal/date";
            interval = 1;

            date = "%a, %e %b, %R";
            date-alt = "%R";

            label = "%date%";
            label-foreground = colors.primary;
          };
        };
      };
      network-base = {
        type = "internal/network";
        interval = 5;
        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
        label-disconnected = "%{F#F0C674}%ifname%%{F#707880} disconnected";
      };
      settings = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
    };
  };
}
