{
  inputs,
  system,
  pkgs,
  config,
  osConfig,
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

    suspend = {
      Unit = {
        Description = "Suspension service";
        After = "night.timer";
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${osConfig.systemd.package}/bin/systemctl suspend";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
  systemd.user.timers = {
    night = {
      Unit = {
        Description = "Night time suspend timer";
      };

      Timer = {
        OnCalendar = [ "*-*-* 22:00:00" ];
        Unit = [ "suspend.service" ];
      };

      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
