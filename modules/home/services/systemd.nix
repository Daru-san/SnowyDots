{ pkgs, ... }:
{
  systemd.user.services = {
    rqbit-server = {
      Service = {
        ExecStart = "${pkgs.rqbit}/bin/rqbit server start Downloads/Torrents";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
    swww-daemon = {
      Service = {
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
    turtle-service = {
      Service.ExecStart = "${pkgs.stable.turtle}/bin/turtle_service";
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
    syncthingtray = {
      Unit = {
        Requires = [ "tray.target" ];
        After = [
          "graphical-session-pre.target"
          "tray.target"
        ];
        PartOf = [ "graphical-session.target" ];
      };
      Service.ExecStart = "${pkgs.syncthingtray}/bin/syncthingtray --wait";
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
