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
          background = "#5ACBCC";
          border = "#285577";
          childBorder = "#5ACBCC";
          indicator = "#2e9ef4";
          text = "#ffffff";
        };
        unfocused = {
          background = "#34495E";
          border = "#2C3E50";
          childBorder = "#34495e";
          indicator = "#7F8C8D";
          text = "#BDC3C7";
        };
        focusedInactive = {
          background = "#16A085";
          border = "#1ABC9C";
          childBorder = "#16A085";
          indicator = "#285577";
          text = "#BDC3C7";
        };
         urgent = {
          background = "#C00030";
          border = "#E06070";
          childBorder = "#E0A0C0";
          indicator = "#e06030";
          text = "#f0f0f0";
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
        border = 2;
      };
      bars = [
        {command = "${config.programs.waybar.package}/bin/waybar";}
      ];
      output = {
        HDMI-A-1 = {
          bg = "~/Wallpapers/personal/horizon fill";
        };
      };
    };

    # Swayfx configuration
    extraConfig = ''
      blur enable
      blur_passes 3
      blur_radius 4
      blur_ignore_transparent enable
      corner_radius 7
      shadows enable
      default_dim_inactive 0.9
      layer_effects "waybar" blur enable; shadows enable; corner_radius 6
    '';
  };
}
