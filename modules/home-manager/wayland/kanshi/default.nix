{...}:{
  services.kanshi = {
    enable = true;
    profiles = {

      # Laptop profile
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };

      # DP monitor profile
      DP = {
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

      # HDMI monitor profile
      HDMI = {
        outputs = [
          {
            criteria = "Samsung Electric Company SyncMaster 0x45463233";
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
