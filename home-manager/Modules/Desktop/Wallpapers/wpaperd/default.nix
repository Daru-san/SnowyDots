{config, ...}:{
  programs.wpaperd = {
    enable = true;
    settings = {
      HDMI-A-1 = {
        path = "${config.home.homeDirectory}/Wallpapers/personal/leaves.jpg";
        apply-shadow = true;
      };
    };
  };
}
