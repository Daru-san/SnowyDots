{
  config,
  pkgs,
  lib,
  ...
}: 
let
  cfg = config.wayland.lxpolkit;
in
 
with lib;
 
{
  options = {
    wayland.lxpolkit = {
      enable = mkOption {
        default = false;
        type = with types; bool;
        description = ''
          Enable lxpolkit
        '';
      };
    };
   };
  config = mkIf cfg.enable {
    systemd.services.lxpolkit = {
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      description = "Start the lxpolkit service.";
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.lxde.lxsession}/bin/lxpolkit";
        Restart = "on-failure";
        RestartSec = 10;
        TimeoutStopSec = 10;
      };
    };
  };
}
