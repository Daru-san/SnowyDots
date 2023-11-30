 {config, pkgs, lib, ...}:
 
 let
   cfg = config.services.audioeffects;
 in
 
 with lib;
 
 {
   options = {
     services.audioeffects = {
       enable = mkOption {
         default = false;
         type = with types; bool;
         description = ''
           Enable audioeffects using easyeffects
         '';
       };
     };
   };
 
   config = mkIf cfg.enable {
     systemd.services.audioeffects = {
       wantedBy = [ "graphical-session.target" ]; 
       after = [ "graphical-session.target" ];
       description = "Start the easyeffects service";
       serviceConfig = {
         Type = "simple";
         ExecStart = ''${pkgs.easyeffects}/bin/easyeffects --gapplication-service'';
         ExecStop = ''${pkgs.busybox}/bin/pkill easyeffects'';
       };
     };
    
    environment.systemPackages = [ pkgs.easyeffects ];
   };
 }
