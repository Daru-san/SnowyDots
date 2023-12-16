{pkgs, ...}:{
    # Enable plymouth and silent boot
    boot = {

      consoleLogLevel = 0; 

      plymouth = {
        enable = true;
        theme = "spinner_alt";
        themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["spinner_alt"];})];
      };
      kernelParams = [ "quiet" ];

      initrd = {
        systemd = {
          enable = true;
          dbus = {
            enable = true;
          };
        };
      };
    };
  }
