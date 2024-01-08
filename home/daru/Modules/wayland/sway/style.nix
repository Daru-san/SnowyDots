{config, ...}:{
  wayland.windowManager.sway = {
    config = {
      colors = {
        background = ;
        focused = ;
        focusedInactive = ;
        placeholder = ;
        unfocused = ;
        urgent = ;
      };
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

      };
      gaps = {
        outer = 11;
        inner = 7;
      };
    };

    # Swayfx configuration
    extraConfig = ''

    '';
  };
}
