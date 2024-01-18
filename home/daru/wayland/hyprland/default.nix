{...}:{
  imports = [
    ./binds.nix
    ./rules.nix
    ./devices.nix
    ./style.nix
    ./autostart.nix
  ];
#Configuring Hyprland 
  {
    systemd = {
      enable = true;
      extraCommands = [
        "systemctl --user start easyeffects.service"
        # "systemctl --user start syncthingtray.service"
        "systemctl --user start app-org.keepassxc.KeePassXC@autostart.service"
        "systemctl --user start swayidle.service"
      ];
    };
    settings = {
      source = [
        "extra.conf"
      ];
    };
  };
}

