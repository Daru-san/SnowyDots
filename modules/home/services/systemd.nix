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
    turtle-service = {
      Service.ExecStart = "${pkgs.turtle}/bin/turtle_service";
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
