{config, ...}:{
  
    #Set up swayidle
    services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${config.programs.swaylock.package}/bin/swaylock -fF"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 800; command = "${config.programs.swaylock.package}/bin/swaylock -fF";}
      { timeout = 1500; command = "systemctl suspend"; }
    ];
  };
}
