{config, pkgs,lib, ...}:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "${pkgs.waypaper}/bin/waypaper --restore"
      "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
      "[workspace name:2 silent] ${config.programs.kitty.package}/bin/kitty -T Git --session git.conf"
      "[workspace name:F12 silent;fullscreen;noanim] ${config.programs.kitty.package}/bin/kitty -T Clock --hold tty-clock -bscBrn"
      "${config.services.copyq.package}/bin/copyq"
      "${config.programs.waybar.package}/bin/waybar"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      "hyprpm reload -n"
    ];
    exec = [
      "systemctl --user restart kanshi.service"

      # Temporary fix for swayosd while https://github.com/nix-community/home-manager/pull/4881 has not been merged yet
      "${config.services.swayosd.package}/bin/swayosd-server"
    ];
  };
  services.kanshi.systemdTarget = mkIf config.wayland.windowManager.hyprland.enable "hyprland-session.target";
}
