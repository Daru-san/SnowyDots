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
    enable = true;
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

