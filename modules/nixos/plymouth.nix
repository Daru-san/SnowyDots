{pkgs, ...}:{
    # Enable plymouth and silent boot
    boot = {

      consoleLogLevel = 0; 

      plymouth = {
        enable = true;
        theme = "Spinner Alt";
        themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["Spinner Alt"];})];
      };
      kernelParams = [ "quiet" "udev.log_level=3" ];

      initrd = {
        systemd = {
          enable = true;
        };
      };
    };
  }
