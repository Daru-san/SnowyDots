{pkgs, config, ...}:{
    imports = [
      ./waybar-style.nix
    ];
  programs.waybar = {
      #Fix for waybar hyprland scrolling
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  []) ++ [ "-Dexperimental=true" ];
      patches = (oa.patches or []) ++ [
        (pkgs.fetchpatch {
         name = "fix waybar hyprctl";
         url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
         sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
        })
      ];
     });
    
    enable = true;
  
  #This option seems to break notifications so I'll keep it disabled for now
    systemd = {
      enable = false;
      target = "hyprland-session.target";
    };

    settings = [
      {
        layer = "top";
        position = "bottom";
        height = 24;
        output = "HDMI-A-1";

        #Enabled modules
        modules-left = [
          "custom/launcher"
          "clock"
          "custom/playerctl"
          ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "pulseaudio" 
          "network" 
          "bluetooth" 
          "battery" 
          "cpu" 
          "memory" 
          "tray" 
          "custom/notification"
        ];

          #Module configs
          "custom/launcher"= {
            format = "";
            tooltip = "true";
            tooltip-format = "NixOS";
            };
          "hyprland/workspaces" = {
              format = "{icon}";
              format-icons = {
                active = "";
                default = "";
                urgent = "";
                sort = "name";
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
             interval = 1;
             tooltip-format = "<tt><small>{calendar}</small></tt>";
             calendar = {
               mode = "year";
               mode-mon-col = 3;
               weeks-pos = "right";
               on-scroll = 1;
               on-click-right = "mode";
               format = {
                 months = "<span color='#ffead3'><b>{}</b></span>";
                 days =  "<span color='#ecc6d9'><b>{}</b></span>";
                 weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                 weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                 today = "<span color='#ff6699'><b><u>{}</u></b></span>";
               };
             };
             on-click-right = "mode";
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
             #   "good": 95,
                 warning = 30;
                 critical = 15;
               };
             format = "{icon} {capacity}%";
             format-charging = "{icon}<small>󱐌</small> {capacity}%";
             # format-plugged = "{capacity}%";
             format-alt = "{time} {icon}";
             format-good = "󰢞"; # An empty format will hide the module
             format-full = "{icon} <i>FULL</i>";
             format-icons = ["󰁺" "󰁼" "󰁿" "󰂁" "󰁹"];
             format-icons-charging = ["󰢜" "󰂇" "󰢝" "󰢞" "󰂋"];
          };
          "pulseaudio" = {
             format = "{icon} {volume}%";
             format-muted = "󰝟 {format_source}";
             format-icons = {
                headphone = "󰋋";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
              };
             on-click = "pavucontrol";
             on-click-right = "${config.services.swayosd.package}/bin/swayosd --output-volume=mute-toggle";
             tooltip = false;
          };
          "network" = {
            # "interface": "wlp2*", 
             format-wifi = "󰖩 ";
             format-ethernet = "󰈀";
             tooltip-format = "{essid}({signalStrength}%)";
             format-linked = "{ifname} (No IP)";
             format-disconnected = "󰖪";
          };
          "bluetooth" = {
            format-on = "󰂯";
            format-off = "󰂲";
            format-disabled = "(󰂲)";
            format-connected = "󰂱";
            tooltip-format = "{status}: {num_connections} devices connected";
            tooltip = true;
            on-click = "blueman-manager";
          };
          "custom/playerctl"= {
            format = "<span>󰎈 {} 󰎈</span>";
            return-type = "json";
            max-length = 20;
            exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
            on-click = "${config.services.playerctld.package}/bin/playerctl play-pause";
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
  #        exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      }
    ];
  };
}
