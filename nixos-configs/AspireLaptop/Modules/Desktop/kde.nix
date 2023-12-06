#This file is specifically for KDE and sddm
{...}:{
  services = {
    xserver = {
      enable = false;
      displayManager = {
        sddm = {
          enable = false;
        };
      };
      desktopManager = {
        plasma5 = {
          enable = false;
        };
      };
    };
  };
}
