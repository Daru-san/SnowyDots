{...}:{
  imports = [inputs.swayosd.homeManagerModules.swayosd];
  services.swayosd = {
    enable = true;
    display = "HDMI-A-1";
    topMargin = 1.0;
  };
}
