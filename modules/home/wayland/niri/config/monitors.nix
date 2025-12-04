{
  programs.niri.settings = {
    outputs = {
      "HDMI-A-2" = {
        variable-refresh-rate = false;
        mode = {
          custom = true;
          height = 1080;
          width = 1920;
          refresh = 70.0;
        };
      };
    };
  };
}
