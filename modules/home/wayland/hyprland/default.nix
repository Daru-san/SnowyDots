{
  inputs,
  pkgs,
  ...
}: {
  imports =
    [
      ./binds.nix
      ./rules.nix
      ./devices.nix
      ./style.nix
      ./autostart.nix
      ./plugins.nix
      ./hyprlock.nix
      ./hypridle.nix
    ]
    ++ (with inputs.hyprland.homeManagerModules; [default]);

  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd = {
      enable = true;
      extraCommands = [
        "systemctl --user start easyeffects.service"
        "systemctl --user start app-org.keepassxc.KeePassXC@autostart.service"
        "systemctl --user start hypridle.service"
        "systemctl --user start swayosd.service"
        "systemctl --user start wlsunset.service"
      ];
    };
    settings = {source = ["extra.conf"];};
  };
}
