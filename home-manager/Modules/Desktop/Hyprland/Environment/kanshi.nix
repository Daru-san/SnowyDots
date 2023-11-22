{...}:{
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

      #Profile for when monitor is connected
      home = {
        outputs = [
        {
          criteria = "Samsung Electric Company SyncMaster HVJZB00655";
          mode = "1920x1080@60";
          position = "0,0";
          scale = 1.0;
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
