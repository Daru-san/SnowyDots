{
  inputs,
  system,
  pkgs,
  config,
  ...
}:
let
  seanime = inputs.seanime.packages.${system}.seanime;
in
{
  systemd.user.services = {
    seanime-server = {
      Unit = {
        Description = "Seanime WebServer";
        After = "network.service";
        X-SwitchMethod = "restart";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        ExecStartPre = "${pkgs.coreutils}/bin/sleep 10";
        ExecStart = "${seanime}/bin/seanime";
        Environment = "PATH=${config.programs.mpv.package}/bin:${pkgs.bash}/bin:${pkgs.coreutils}/bin";
      };
    };
  };
}
