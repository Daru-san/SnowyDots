{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  cfg = config.wayland;
in {
  imports = [./config];
  config = lib.mkIf cfg.enable {
    services.hyprpaper.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      systemd = {
        enable = true;
        extraCommands = [
          "systemctl --user start easyeffects.service"
          "systemctl --user start hypridle.service"
          "systemctl --user start swayosd.service"
          "systemctl --user start wlsunset.service"
          "systemctl --user start hyprpaper"
          "systemctl --user start udiskie"
          "systemctl --user start kdeconnect"
          "systemctl --user start kdeconnect-indicator"
          "systemctl --user stop swaync"
          "systemctl --user start polkit-gnome-authentication-agent-1"
        ];
      };
      settings = {source = ["extra.conf"];};
    };
  };
}
