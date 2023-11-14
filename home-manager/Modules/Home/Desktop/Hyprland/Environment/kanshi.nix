{pkgs, ...}:{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    profiles = {

      #Profile for when laptop is not connected to monitor
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };

      #kanshi setup for monitor
      home = {
        outputs = [
        {
          criteria = "Samsung Electric Company SyncMaster 0x45463233";
          mode = "1920x1080@60";
          position = "0,0";
          scale = 1.1;
        }
        {
          criteria = "eDP-1";
          status = "disable";
        }
        ];
      };
    };
  };
}
