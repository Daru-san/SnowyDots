{ ... }: {

  # Import the module from https://github.com/rhoriguchi/home-manager
  # since https://github.com/nix-community/home-manager/pull/4249 has not been merged,
  # and doesn't seem like it will be anytime soon
  imports = [
    (import (builtins.fetchurl {
      url =
        "https://raw.githubusercontent.com/rhoriguchi/home-manager/swaync/modules/services/swaync.nix";
    }))
  ];

  services.swaync = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = false;
      control-center-width = 500;
      control-center-height = 1025;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "title"
        "buttons-grid"
        "mpris"
        "volume"
        "backlight"
        "dnd"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰆴 Clear All";
        };
        dnd = { text = "Do Not Disturb"; };
        label = {
          max-lines = 1;
          text = "Notification Center";
        };
        mpris = {
          image-size = 96;
          image-radius = 7;
        };
        volume = { label = "󰕾"; };
        backlight = { label = "󰃟"; };
        buttons-grid = {
          actions = [
            {
              label = "󰐥";
              command = "systemctl poweroff";
            }
            {
              label = "󰜉";
              command = "systemctl reboot";
            }
            {
              label = "";
              command = "nautilus";
            }
            {
              label = "";
              command = "pavucontrol";
            }
            {
              label = "";
              command = "spotify";
            }
            {
              label = "󰕾";
              command = "wpctl set-mute @DEFAULT_SINK@ toggle";
            }
            {
              label = "󰍬";
              command = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
            }
          ];
        };
      };
    };
    style = (builtins.readFile ./style.css);
  };
}
