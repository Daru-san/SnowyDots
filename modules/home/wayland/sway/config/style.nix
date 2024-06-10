{config, ...}: {
  wayland.windowManager.sway = {
    config = {
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
      bars = [{command = "${config.programs.waybar.package}/bin/waybar";}];
      output."*".bg = "${config.wallpaperImage} fill";
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
