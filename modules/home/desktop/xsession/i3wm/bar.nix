{
  pkgs,
  config,
  ...
}: {
  xsession.windowManager.i3.config.bars = [
    {
      position = "top";
      mode = "dock";
      fonts = {
        names = ["JetbrainsMono NF"];
        style = "Bold Semi-Condensed";
        size = 12.5;
      };
      statusCommand = "${config.programs.i3status-rust.package}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
    }
  ];
  programs.i3status-rust = {
    enable = true;
    bars.top = {
      theme = "nord-dark";
      icons = "awesome6";
      blocks = [
        {
          block = "cpu";
        }
        {
          alert = 10.0;
          block = "disk_space";
          format = " $icon root: $available.eng(w:2) ";
          info_type = "available";
          interval = 20;
          path = "/";
          warning = 20.0;
        }
        {
          block = "memory";
          format = " $icon $mem_total_used_percents.eng(w:2) ";
          format_alt = " $icon_swap $swap_used_percents.eng(w:2) ";
        }
        {
          block = "sound";
          click = [
            {
              button = "left";
              cmd = "pavucontrol";
            }
          ];
        }
        {
          block = "time";
          format = " $timestamp.datetime(f:'%a, %e %b, %R') ";
          interval = 5;
        }
      ];
    };
  };
}
