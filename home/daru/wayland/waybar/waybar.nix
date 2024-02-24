# # To be replaced with ags
{
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    #Fix for waybar hyprland scrolling
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
      patches =
        (oa.patches or [])
        ++ [
          (pkgs.fetchpatch {
            name = "fix waybar hyprctl";
            url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
            sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
          })
        ];
    });

    enable = true;

    style = ''
      ${config.theme.colorScheme.css}
      ${with builtins; readFile ./style.css}
    '';

    settings = [
      {
        layer = "top";
        position = "bottom";
        height = 16;
        output = "HDMI-A-1";

        #Enabled modules
        modules-left = ["clock" "custom/playerctl"];
        modules-center = [
          # "sway/workspaces"
          "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
          "pulseaudio"
          "pulseaudio/slider"
          "network"
          "bluetooth"
          "battery"
          # "cpu"
          # "memory"
          "custom/notification"
        ];

        #####################
        ## Module configs ###
        ####################

        "custom/launcher" = {format = "";};
        "sway/workspaces" = {
          format = "{icon}";
          format-icons = {
            "0" = "";
            "1" = "";
            "2" = "󰜗";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "󱇣";
            "8" = "";
            "9" = "";
            "F1" = "󰈹";
            "F2" = "󰍳";
            "F3" = "󰏪";
            "F4" = "";
            "F5" = "󰝚";
            "F6" = "";
            "F7" = "󰗃";
            "F8" = "";
            "F9" = "";
            "F10" = "󰈙";
            "F11" = "";
            "F12" = "";
            "default" = "";
            "urgent" = "󰗖";
          };
          disable-scroll-wraparound = true;
          numeric-first = true;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "0" = "";
            "1" = "";
            "2" = "󰜗";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "󱇣";
            "8" = "";
            "9" = "";
            "F1" = "󰈹";
            "F2" = "";
            "F3" = "";
            "F4" = "";
            "F5" = "󰝚";
            "F6" = "";
            "F7" = "󰗃";
            "F8" = "";
            "F9" = "";
            "F10" = "󰈙";
            "F11" = "";
            "F12" = "";
            "default" = "";
            "urgent" = "󰗖";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "tray" = {
          spacing = 10;
          icon-size = 21;
        };
        "clock" = {
          format-alt = " {:%R}";
          format = " {:%a, %e %b, %R}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          on-click-right = "mode";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };
        "cpu" = {
          format = " {usage}%";
          format-alt = " {load}";
          tooltip = false;
          interval = 2;
        };
        "memory" = {
          format = " {}%";
          format-alt = "{used:0.1f}G/{total:0.1f}G";
          interval = 2;
          tooltip = false;
        };
        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-good = "󰢞";
          format-icons = ["󰁺" "󰁼" "󰁿" "󰂁" "󰁹"];
          format-critical = "<span foreground='red'>{icon}<sup></sup></span>";
          format-warning = "{icon}<span foreground='orange'><sup></sup></span>";
          format-charging = "{icon}<span foreground='yellow'><sup>󱐌</sup></span>";
          format-full = "{icon}<span foreground='green'><sup></sup></span>";
        };
        "pulseaudio" = {
          ignored-sinks = ["Easy Effects Sink"];
          format = "{icon} {volume}%";
          format-muted = "󰝟 {format_source}";
          format-icons = {
            headphone = "󰋋";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pypr show volume";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          tooltip = false;
        };
        "pulseaudio/slider" = {
          ignored-sinks = ["Easy Effects Sink"];
          min = 0;
          max = 100;
          orientation = "horizontal";
        };
        "network" = {
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          tooltip-format = "{essid}({signalStrength}%)";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "󰖪";
          on-click = "pypr show wifi";
        };
        "bluetooth" = {
          format-on = "󰂯";
          format-off = "󰂲";
          format-disabled = "(󰂲)";
          format-connected = "󰂱";
          tooltip-format = "{status}: {num_connections} devices connected";
          tooltip = true;
          on-click = "pypr show bluetooth";
        };
        "custom/playerctl" = {
          format-alt = "󰎈 Music playing 󰎈";
          format = "<span>󰎈 {} 󰎈</span>";
          return-type = "json";
          max-length = 40;
          exec = ''
            playerctl -a metadata --format '{"text": "{{artist}} - {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F'';
          on-click-right = "${config.services.playerctld.package}/bin/playerctl play-pause";
        };
        "custom/notification" = {
          format = "{icon}";
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
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      }
    ];
  };
}
