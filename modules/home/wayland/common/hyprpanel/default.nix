{
  programs.hyprpanel = {
    settings = {
      hyprpanel.restartAgs = false;
      bar.launcher.autoDetectIcon = true;
      bar.layouts = {
        "0" = {
          left = [
            "workspaces"
            "media"
          ];
          middle = [
            "clock"
            "notifications"
            "dashboard"
          ];
          right = [
            "volume"
            "cpu"
            "ram"
            "network"
            "bluetooth"
            "systray"
          ];
        };
      };
      theme.bar.border.location = "full";
      theme.bar.layer = "background";
      bar.network.showWifiInfo = true;
      bar.network.label = false;
      bar.bluetooth.label = false;
      bar.clock.showIcon = true;
      bar.clock.format = "%X";
      menus.media.displayTime = true;
      menus.media.displayTimeTooltip = true;
      notifications.showActionsOnHover = true;
      notifications.displayedTotal = 5;
      theme.bar.menus.menu.notifications.height = "47em";
      theme.osd.orientation = "horizontal";
      theme.osd.location = "bottom";
      theme.osd.margins = "7px 7px 7px 8px";
      menus.clock.time.military = true;
      menus.clock.weather.enabled = false;
      menus.dashboard.directories.enabled = false;
      menus.dashboard.shortcuts.enabled = false;
      menus.dashboard.powermenu.avatar.image = "/home/daru/Cabin/Media/Pictures/old-pf.png";
      bar.customModules.cpuTemp.unit = "metric";
      bar.customModules.cpu.round = false;
      bar.customModules.ram.pollingInterval = 2000;
      bar.customModules.cpu.pollingInterval = 2000;
      bar.customModules.ram.labelType = "used/total";
      bar.customModules.ram.round = false;
      theme.font.size = "14px";
      theme.bar.outer_spacing = "0em";
      theme.bar.buttons.enableBorders = false;
      theme.bar.menus.monochrome = false;
      theme.bar.buttons.monochrome = false;
      menus.transition = "crossfade";
    };
  };
}
