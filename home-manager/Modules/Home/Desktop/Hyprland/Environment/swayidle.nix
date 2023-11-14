{pkgs, config, ...}:{
    #Set up swayidle
    services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${config.programs.swaylock.package}/bin/swaylock -fF"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 400; command = "${config.programs.swaylock.package}/bin/swaylock -fF";}
      { timeout = 1200; command = "systemctl suspend"; }
    ];
    systemdTarget = "xdg-desktop-portal-hyprland.service";
  };
}
