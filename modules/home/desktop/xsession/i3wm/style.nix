{config, ...}: {
  xsession.windowManager.i3 = {
    config = {
      bars = [{command = "${config.programs.polybar.package}/bin/polybar simple";}];
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
        outer = 6;
        inner = 4;
      };
      window = {
        titlebar = false;
        border = 0;
      };
    };
  };
}
