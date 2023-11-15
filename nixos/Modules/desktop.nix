{pkgs, ...}:{

#Enable greetd using tuigreet
  services.greetd = {
    package = pkgs.unstable.greetd;
    enable = true;
    settings = rec {
     initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to AspireNix' -c Hyprland";
        user = "daru";
     };
     default_session = initial_session;
    };
  };

  # X11 (Disabled since I use wayland)
  services = {
    xserver = {
      enable = false;

      #Keyboard settings
      layout = "za";
      xkbVariant = "";

      #Display managers
      displayManager = {
        #GDM for gnome
        gdm = {
          enable = false;
        };
        #SDDM for kde
        sddm = {
          enable = false;
        };
      };
      #Desktop environments
      desktopManager = {
        #KDE
        plasma5 = {
          enable = false;
        };
        #GNOME
        gnome = {
          enable = false;
        };
      };
    };
  };
}
