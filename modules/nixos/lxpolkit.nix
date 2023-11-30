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
 
      systemdTarget = lib.mkOption {
        type = lib.types.str;
        default = "graphical-session.target";
        example = "sway-session.target";
        description = ''
          The systemd target that will automatically start the lxpolkit service.

          When setting this value to `"sway-session.target"`,
          make sure to also enable {option}`wayland.windowManager.sway.systemd.enable`,
          otherwise the service may never be started.
        '';
      };
     };
   };
 
   config = mkIf cfg.enable {
     systemd.services.lxpolkit = {
       wantedBy = [ "${cfg.systemdTarget}" ];
       wants = [ "${cfg.systemdTarget}" ];
       after = [ "${cfg.systemdTarget}" ];
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
