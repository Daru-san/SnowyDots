{pkgs,  ...}:{
  imports = [
    ./binds.nix
    ./fonts.nix
    ./rules.nix
    ./devices.nix
    ./style.nix
    ./autostart.nix
  ];
#Configuring Hyprland 
  wayland.windowManager.hyprland = {
    #Temporarily disabled until I can get it to work
    enable = true;
    #Use unstable package
    package = pkgs.unstable.hyprland;
    # enableNvidiaPatches = true;
    systemd = {
      enable = true;
    };
    settings = {
      source = [
        "extra.conf"
      ];
    };
  };
}

