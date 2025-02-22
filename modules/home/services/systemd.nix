{ pkgs, ... }:
{
  systemd.user.services = {
    seanime-server = {
      Service = {
        ExecStart = "${pkgs.seanime}/bin/seanime";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
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
