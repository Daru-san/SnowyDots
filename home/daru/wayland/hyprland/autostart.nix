{config, pkgs,lib, ...}:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
      "[workspace name:2 silent] ${config.programs.kitty.package}/bin/kitty -T Git --session git.conf"
      "[workspace name:F12 silent;fullscreen;noanim] ${config.programs.kitty.package}/bin/kitty -T Clock --hold tty-clock -bscBrn"
      "${config.services.copyq.package}/bin/copyq"
      "${config.programs.waybar.package}/bin/waybar"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      "hyprpm reload -n"
      # "swww init"
      "${config.programs.wpaperd.package}/bin/wpaperd"
    ];
    exec = [
      "systemctl --user restart kanshi.service"

      "swww init"
    ];
  };
  services.kanshi.systemdTarget = mkIf config.wayland.windowManager.hyprland.enable "hyprland-session.target";
}
