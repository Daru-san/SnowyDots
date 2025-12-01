{
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
  };
}
