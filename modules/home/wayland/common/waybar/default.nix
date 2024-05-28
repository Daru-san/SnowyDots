{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe getExe';
  inherit (pkgs) writeShellScriptBin;
  mixxc = getExe pkgs.mixxc;
  iwgtk = getExe pkgs.iwgtk;
  playerctl = getExe' config.services.playerctld.package "playerctl";
  swaync-client = getExe' config.services.swaync.package "swaync-client";
  idle-inhibit = getExe (writeShellScriptBin "idle-inhibit" ''
    if pgrep 'hypridle'; then
      systemctl --user stop hypridle.service
      inhibited=off
    else
      systemctl --user start hypridle.service
      inhibited=on
    fi
    hyprctl notify -1 6000 0 'Idle inhibiting is now $inhibited'
  '');
in {
  programs.waybar = {
    style = builtins.concatStringsSep "\n" [
      config.colorSchemeCss
      (builtins.readFile ./style.css)
      "/* EOF */"
    ];

    settings = [
      {
        layer = "top";
        position = "top";
        height = 16;
        output = "HDMI-A-1";

        modules-left = ["hyprland/workspaces" "custom/playerctl"];
        modules-center = ["clock" "custom/notification"];
        modules-right = [
          "idle_inhibitor"
          "network"
          "bluetooth"
          "battery"
          "pulseaudio"
          "pulseaudio/slider"
          "tray"
        ];
        "hyprland/workspaces" = {
          format = "{name}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        tray = {
          spacing = 10;
          icon-size = 21;
        };
        idle_inhibitor = {
          format = "{icon}";
          on-click = idle-inhibit;
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        clock = {
          format-alt = " {:%X}";
          format = " {:%a, %e %b, %R}";
          interval = 1;
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
        cpu = {
          format = " {usage}%";
          format-alt = " {load}";
          tooltip = false;
          interval = 2;
        };
        memory = {
          format = " {}%";
          format-alt = "{used:0.1f}G/{total:0.1f}G";
          interval = 2;
          tooltip = false;
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{icon}<span foreground='yellow'><sup>󱐌</sup></span> {capacity}%";
          format-critical = "<span foreground='red'>{icon}<sup></sup></span> {capacity}%";
          format-full = "{icon}<span foreground='green'><sup></sup></span> {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        pulseaudio = {
          ignored-sinks = ["Easy Effects Sink"];
          format = "{icon}  {volume}%";
          format-muted = "󰝟 {format_source}";
          format-icons = {
            headphone = "󰋋";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "${mixxc} --anchor right --anchor top --margin 20 --margin 30 -M";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          tooltip = false;
        };
        "pulseaudio/slider" = {
          ignored-sinks = ["Easy Effects Sink"];
          min = 0;
          max = 100;
          orientation = "horizontal";
        };
        network = {
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          tooltip-format = "{essid}({signalStrength}%)";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "󰖪";
          on-click = iwgtk;
        };
        bluetooth = {
          format-on = "󰂯";
          format-off = "󰂲";
          format-disabled = "(󰂲)";
          format-connected = "󰂱";
          tooltip-format = "{status}: {num_connections} devices connected";
          tooltip = true;
          on-click = "blueman-manager";
        };
        "custom/playerctl" = {
          format = "<span>󰎇 {} 󰎇</span>";
          return-type = "json";
          max-length = 40;
          exec = ''
            ${playerctl} -a metadata --format '{"text": "{{artist}} - {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F
          '';
          on-click-right = "${playerctl} play-pause";
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
          exec = "${swaync-client} -swb";
          on-click = "${swaync-client} -t -sw";
          on-click-right = "${swaync-client} -d -sw";
          escape = true;
        };
      }
    ];
  };
}
