{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.wayland.compositor;
in
  with lib; {
    imports = [
      ./ags
      ./kitty
      ./config
      ./anyrun
    ];
    config = mkIf (cfg == "hyprland") {
      services = let
        systemdTarget = "hyprland-session.target";
      in {
        wlsunset = {inherit systemdTarget;};
        kanshi = {inherit systemdTarget;};
        swaync.systemd.target = systemdTarget;
      };
      wayland = {
        launcher.anyrun.enable = true;
        terminal.kitty.enable = true;
        windowManager.hyprland = {
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
      };
    };
  }
