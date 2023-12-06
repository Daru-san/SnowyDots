{...}:{
  imports = [
    ./binds.nix
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
      extraCommands = [
        "systemctl --user start kanshi.service"
        "systemctl --user start easyeffects.service"
        "systemctl --user start syncthingtray.service"
      ];
    };
    settings = {
      source = [
        "extra.conf"
      ];
    };
  };
}

