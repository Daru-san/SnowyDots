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
        syncthing-status = {
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
      wallpaper.enabled = false;
      general = {
        showChangelogOnStartup = false;
        radiusRatio = 0.2;
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
              id = "plugin:syncthing-status";
            }
            {
              id = "Tray";
            }
          ];
          right = [
            {
              id = "SystemMonitor";
              compactMode = false;
              showCpuCores = false;
              showCpuFreq = true;
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskAvailable = false;
              showDiskUsage = false;
              showDiskUsageAsPercent = false;
              showGpuTemp = false;
              showLoadAverage = false;
              showMemoryAsPercent = false;
              showMemoryUsage = true;
              showNetworkStats = true;
              showSwapUsage = false;
              useMonospaceFont = true;
              usePadding = false;
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
      noctaliaPerformance = {
        disableWallpaper = true;
        disableDesktopWidgets = true;
      };
      dock.enabled = false;
      ui = {
        translucentWidgets = true;
        panelsAttachedToBar = false;
        settingsPanelMode = "window";
        settingsPanelSideBarCardStyle = false;
      };
    };
  };
}
