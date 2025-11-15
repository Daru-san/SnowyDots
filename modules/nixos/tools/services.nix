{ pkgs, ... }:
{
  services = {
    vnstat.enable = true;
    gvfs.enable = true;
  };

  systemd.services = {
    mpd-forward = {
      enable = true;
      description = "Forward the MPD port so other devices can connect to MPD.";
      script = "${pkgs.socat}/bin/socat TCP-LISTEN:80,fork TPC:localhost:6600";
      after = [ "mpd.service" ];
    };
    seanime-forward = {
      enable = true;
      description = "Forward the seanime port so other devices can connect to seanime.";
      script = "${pkgs.socat}/bin/socat TCP-LISTEN:90,fork TPC:localhost:43211";
      after = [ "seanime.service" ];
    };
  };
}
