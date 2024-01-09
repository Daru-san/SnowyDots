{config, ...}:{
  wayland.windowManager.sway = {
    config = {
      fonts = {
        names = [ "JetbrainsMono Nerd Font" "UbuntuMono Nerd Font" ];
        style = "Semi-Bold";
        size = 13.4;
      };
     colors = {
        focused = {
          border = "#64E8F5"
        };
        focusedInactive = {
          border = "#1A325B"
        };
        unfocused = {
          border = "#212121";
        };
        urgent = {
          border = "#BE3DDE";
        };
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
        border = 3;
      };
      output = {
        # HDMI-A-1 = {
        #   bg = "~/Pictures/walls/39679.jpg fill";
        # };
      };
      bars = [
        {command = "${config.programs.waybar.package}/bin/waybar";}
      ];
    };

    # Swayfx configuration
    extraConfig = ''
      blur enable
      blur_passes 3
      blur_radius 4
      blur_ignore_transparent enable
      corner_radius 7
      shadows enable
      default_dim_inactive 0.7
    '';
  };
}
