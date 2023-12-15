{pkgs, ...}:{
    # Enable plymouth and silent boot
    boot = {

      consoleLogLevel = 0; 

      plymouth = {
        enable = true;
        theme = "spinner_alt";
        themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["spinner_alt"];})];
      };
      kernelParams = [ "quiet" "udev.log_level=3" ];

      initrd = {
        systemd = {
          enable = true;
        };
      };
    };
  }
