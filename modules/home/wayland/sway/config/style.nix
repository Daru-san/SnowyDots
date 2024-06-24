{config, ...}: {
  wayland.windowManager.sway = {
    config = {
      defaultWorkspace = "workspace number 1";
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
        outer = 2;
        inner = 1;
      };
      window = {
        titlebar = false;
        border = 0;
      };
      bars = [{mode = "invisible";}];
    };

    extraConfig = ''
      blur true
      blur_passes 1
      blur_radius 3

      corner_radius 7

      shadows false
      shadow_blur_radius 70
      shadow_color #202020
    '';
  };
}
