{pkgs, ...}:{
  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.gtklock}/bin/gtklock -id"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 800; command = "${pkgs.gtklock}/bin/gtklock id";}
      { timeout = 1500; command = "systemctl suspend"; }
    ];
  };
}
