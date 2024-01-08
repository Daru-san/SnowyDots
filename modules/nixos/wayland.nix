{pkgs, ...}:{

  # Fix swaylock not unlocking
  security.pam.services.swaylock.text = ''
    auth include login
   '';

  # Enable dconf
  programs.dconf.enable = true;

  # Enable Hyprland
  programs.hyprland = { 
    enable = false;
  };

  # Enable sway
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    extraPackages = [
      autotiling-rs
    ];
  };

}
