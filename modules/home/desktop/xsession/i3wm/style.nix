{config, ...}: {
  xsession.windowManager.i3 = {
    extraConfig = ''border_radius 5'';
    config = {
      bars = [{command = "${config.services.polybar.package}/bin/polybar simple";}];
      fonts = {
        names = ["JetbrainsMono Nerd Font" "UbuntuMono Nerd Font"];
        style = "Semi-Bold";
        size = 13.4;
      };
      focus = {
        followMouse = true;
        newWindow = "smart";
      };
      gaps = {
        outer = 3;
        inner = 2;
      };
      window = {
        titlebar = false;
        border = 0;
      };
    };
  };
}
