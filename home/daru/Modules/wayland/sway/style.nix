{config, ...}:{
  wayland.windowManager.sway = {
    config = {
      fonts = {
        names = [ "JetbrainsMono Nerd Font" "UbuntuMono Nerd Font" ];
        style = "Semi-Bold";
        size = 13.4;
      };
      # colors = {
      #   background = ;
      #   focused = ;
      #   focusedInactive = ;
      #   placeholder = ;
      #   unfocused = ;
      #   urgent = ;
      # };
      floating = {
        border = 6;
        criteria = [
          { 
            title = "firefox-nightly - Library";
          }
          {
            class = "com.github.wwmm.easyeffects";
          }
          {
            class = ".blueman-manager-wrapped";
          }
          {
            class = "com.github.hluk.copyq";
          }
          {
            class = "Pavucontrol";
          }
        ];
        titlebar = false;
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
        HDMI-A-1 = {
          bg = "~/Pictures/walls/39679.jpg fill";
        };
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
