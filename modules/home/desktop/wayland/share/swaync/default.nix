{...}: {
  # Import the module from https://github.com/rhoriguchi/home-manager
  # since https://github.com/nix-community/home-manager/pull/4249 has not been merged,
  # and doesn't seem like it will be anytime soon
  imports = [
    (import (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/rhoriguchi/home-manager/swaync/modules/services/swaync.nix";
      sha256 = "0y8hf85yqlvj61xwha75p1nywn3m8m3bjngsa6ak906xdi2c63rg";
    }))
  ];

  services.swaync = {
    systemd.enable = true;
    settings = {
      positionX = "centre";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "overlay";
      layer-shell = true;
      cssPriority = "application";
      control-center-positionX = "centre";
      control-center-positionY = "top";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 48;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 5;
      timeout-low = 10;
      timeout-critical = 10;
      fit-to-screen = false;
      control-center-width = 400;
      control-center-height = 650;
      notification-window-width = 400;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;
      notification-visibility = {
        spotify = {
          state = "muted";
          urgency = "Low";
          app-name = "Spotify";
        };
      };
      widgets = [
        "inhibitors"
        "title"
        "mpris"
        "notifications"
        "dnd"
      ];
      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 64;
          image-radius = 50;
        };
      };
    };
    style = builtins.readFile ./style.css;
  };
}
