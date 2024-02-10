{
  inputs
, pkgs
, ...
}:
{
  imports = [
    ./binds.nix
    ./rules.nix
    ./devices.nix
    ./style.nix
    ./autostart.nix
    ./plugins.nix
  ];
# Configuring Hyprland 
  wayland.windowManager.hyprland = {
    # Use the upstream package from the flake
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
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

