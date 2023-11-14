{...}:{
#Enable greetd
  services.greetd = {
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
  services.xserver.enable = false;

  #Both GNOME AND KDE are disabled but can be reenabled here

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;
  
  #KDE
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.desktopManager.plasma5.enable = false;

  # Configure keymap in X11
  services.xserver = {
    layout = "za";
    xkbVariant = "";
  };

}
