{pkgs, ...}: {
  systemd.user.services = {
    rqbit-server = {
      Service = {
        Wants = ["network.target"];
        ExecStart = "${pkgs.rqbit}/bin/rqbit server start ~/Downloads/Torrents";
      };
      Install = {WantedBy = ["multi-user.target"];};
    };
  };
}
