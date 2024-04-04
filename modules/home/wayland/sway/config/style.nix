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
        outer = 6;
        inner = 4;
      };
      window = {
        titlebar = false;
        border = 0;
      };
      bars = [{command = "${config.programs.waybar.package}/bin/waybar";}];
      output = {HDMI-A-1 = {bg = config.wallpaperImage;};};
    };

    extraConfig = ''
      blur false
      blur_passes 4
      blur_radius 4
      blur_ignore_transparent enable

      corner_radius 7

      shadows enable
      shadow_blur_radius 70
      shadow_color #202020

      default_dim_inactive 0.17
      layer_effects "waybar" blur enable; shadows enable; corner_radius 20
    '';
  };
}
