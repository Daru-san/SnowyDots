{
  services.kanshi = {
    enable = true;
    profiles = {
      Laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };
      Laptop-DP = {
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
      Laptop-HDMI = {
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
      Desktop-DP = {
        outputs = [
          {
            criteria = "Samsung Electric Company SyncMaster HVJZB00655";
            mode = "1920x1080@60";
            position = "0,0";
            scale = 1.0;
          }
        ];
      };
      Desktop-HDMI = {
        outputs = [
          {
            criteria = "Samsung Electric Company SyncMaster 0x45463233";
            mode = "1920x1080@60";
            position = "0,0";
            scale = 1.0;
          }
        ];
      };
    };
  };
}
