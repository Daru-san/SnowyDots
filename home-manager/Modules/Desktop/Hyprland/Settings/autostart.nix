{config, pkgs, ...}:{
  wayland.windowManager.hyprland.settings = {
    exec = [
      "${pkgs.swaynotificationcenter}/bin/swaync"
    ];
    exec-once = [
    "${config.programs.waybar.package}/bin/waybar"
    "${pkgs.waypaper}/bin/waypaper --restore"
    "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
    "[workspace name:2 silent] ${config.programs.kitty.package}/bin/kitty -T Git --session git.conf"
    "[workspace name:F12 silent] ${config.programs.kitty.package}/bin/kitty -T Clock --hold tty-clock -bscBrn"
    "${pkgs.easyeffects}/bin/easyeffects"
    "${pkgs.networkmanagerapplet}/bin/nm-applet"
    "${config.services.copyq.package}/bin/copyq"
    ];
  };
}
