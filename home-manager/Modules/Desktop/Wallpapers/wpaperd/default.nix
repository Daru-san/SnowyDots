{config, ...}:{
  programs.wpaperd = {
    enable = true;
    settings = {
      HDMI-A-1 = {
        path = "/home/${config.home.username}/Wallpapers/personal/leaves.jpg";
        apply-shadow = true;
      };
    };
  };
}
