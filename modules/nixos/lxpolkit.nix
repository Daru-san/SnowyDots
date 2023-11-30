 {config, pkgs, lib, ...}:
 
 let
   cfg = config.services.lxpolkit;
 in
 
 with lib;
 
 {
   options = {
     services.lxpolkit = {
       enable = mkOption {
         default = false;
         type = with types; bool;
         description = ''
           Enable lxpolkit
         '';
       };
 
       systemdTarget = mkOption {
         default = "graphical-session.target";
         type = with types; uniq string;
         description = ''
           The systemd target the service wait for
         '';
       };
     };
   };
 
   config = mkIf cfg.enable {
     systemd.services.lxpolkit = {
       wantedBy = [ "graphical-session.target" ];
       wants = [ "graphical-session.target" ];
       after = [ "${cfg.systemdTarget}" ];
       description = "Start the lxpolkit service.";
       serviceConfig = {
         Type = "simple";
         ExecStart = "${pkgs.lxde.lxsession}/bin/lxpolkit";
         Restart = "on-failure";
         RestartSec = 1;
         TimeoutStopSec = 10;
        };
      };
   };
 }
