{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia-shell = {
    package = pkgs.noctalia-shell;
    systemd.enable = true;

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        network-indicator = {
          enabled = true;
        };
      };
      version = 1;
    };
    settings = {
      controlCenter = {
        cards = [
          {
            enabled = false;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
          {
            enabled = false;
            id = "calendar-card";
          }
          {
            enabled = false;
            id = "shortcuts-card";
          }
        ];
      };

      general = {
        showChangelogOnStartup = false;
      };
      bar = {
        density = "compact";
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          center = [
            {
              id = "MediaMini";
            }
            {
              formatHorizontal = "HH:mm:ss - ddd d MMM";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Tray";
            }
          ];
          right = [
            {
              id = "NetworkIndicator";
            }
            {
              id = "SystemMonitor";
            }
            {
              alwaysShowPercentage = true;
              id = "Battery";
              warningThreshold = 30;
            }
            {
              id = "Volume";
            }
            {
              id = "Brightness";
            }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
          ];
        };
      };
      general = {
        radiusRatio = 0.2;
      };
    };
  };
}
