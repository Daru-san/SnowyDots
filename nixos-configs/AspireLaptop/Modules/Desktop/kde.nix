#This file is specifically for KDE and sddm
{...}:{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        sddm = {
          enable = true;
        };
      };
      desktopManager = {
        plasma5 = {
          enable = true;
        };
      };
    };
  };
}
