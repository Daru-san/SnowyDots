{
  systemd.user.targets = {
    niri-session = {
      Unit = {
        Description = "niri session";
        After = [ "graphical-session-pre.target" ];
        Before = [ "xdg-desktop-autostart.target" ];
        BindsTo = [ "graphical-session.target" ];
        Documentation = [ "man:systemd.special(7)" ];
        Wants = [
          "graphical-session-pre.target"
          "xdg-desktop-autostart.target"
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
