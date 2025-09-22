{
  lib,
  pkgs,
  config,
  ...
}:
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
    mpdris2 =
      let
        mpd = config.services.mpd;
      in
      {
        Service = {
          ExecStart = lib.concatStringsSep " " [
            "${lib.getExe pkgs.mpdris2-rs}"
            (lib.cli.toGNUCommandLineShell { } {
              host = "${mpd.network.listenAddress}:${toString mpd.network.port}";
              v = true;
            })
          ];
        };
        Install = {
          WantedBy = [ "mpd.socket" ];
        };
      };
  };
}
