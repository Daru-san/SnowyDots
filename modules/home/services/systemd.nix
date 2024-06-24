{pkgs, ...}: {
  systemd.user.services = {
    rqbit-server = {
      Service = {
        ExecStart = "${pkgs.rqbit}/bin/rqbit server start Downloads/Torrents";
      };
      Install = {WantedBy = ["default.target"];};
    };
  };
}
