{
  services.kanshi = {
    settings = [
      {
        profile.name = "laptop";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      }
      {
        profile.name = "laptop-DP";
        profile.outputs = [
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
      }
      {
        profile.name = "Samsung Overclock";
        profile.outputs = [
          {
            criteria = "Samsung Electric Company S24E390 0x30303342";
            mode = "1920x1080@60";
            position = "0,0";
            scale = 1.0;
            exec = "hyprctl keyword monitor HDMI-A-2,1920x1080@70,0x0,1";
          }
        ];
      }
      {
        profile.name = "laptop-HDMI";
        profile.outputs = [
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
      }
    ];
  };
}
