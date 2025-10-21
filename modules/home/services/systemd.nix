{
  pkgs,
  inputs,
  system,
  ...
}:
{
  systemd.user.services = {
    seanime-server = {
      Service = {
        ExecStart = "${inputs.seanime.packages.${system}.seanime}/bin/seanime";
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
  };
}
