{pkgs, ...}: {
  systemd.user.services = {
    rqbit-server = {
      Service = {
        ExecStart = "${pkgs.rqbit}/bin/rqbit server start Downloads/Torrents";
      };
      Install = {WantedBy = ["default.target"];};
    };
    swww-daemon = {
      Service = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
        After = ["graphical-session-pre.target"];
        PartOf = ["graphical-session.target"];
      };
      Install = {WantedBy = ["graphical-session.target"];};
    };
  };
}
