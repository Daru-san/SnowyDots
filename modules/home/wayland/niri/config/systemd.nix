{
  systemd.user.targets = {
    niri-session = {
      Unit = {
        Requires = [ "niri.service" ];
        Wants = [
          "hypridle.service"
          "tray.target"
          "swww-daemon.service"
          "wlsunset.service"
          "avizo.service"
          "snowy-shell.service"
          "xdg-desktop-portal-gnome.service"
        ];
      };
    };
    tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
  };
}
