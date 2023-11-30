{...}:{
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
      extraCommands = [
        "systemctl --user start kanshi.service"
        "systemctl --user start easyeffects.service"
      ];
    };
    settings = {
      source = [
        "extra.conf"
      ];
    };
  };
}

