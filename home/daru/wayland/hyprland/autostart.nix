{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
      "${config.services.copyq.package}/bin/copyq"
      "${config.programs.waybar.package}/bin/waybar"
      "swww init"
    ];
    exec = [
      "systemctl --user restart kanshi.service"

      "swww img ${config.theme.wallpaper.image}"
    ];
  };
  services.kanshi.systemdTarget = mkIf config.wayland.windowManager.hyprland.enable "hyprland-session.target";
  services.wlsunset.systemdTarget = mkIf config.wayland.windowManager.hyprland.enable "hyprland-session.target";
}
