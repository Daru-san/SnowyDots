{config, pkgs, ...}:{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
    "${pkgs.swaynotificationcenter}/bin/swaync"
    "${pkgs.waypaper}/bin/waypaper --restore"
    "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
    "[workspace name:2 silent] ${config.programs.kitty.package}/bin/kitty -T Git --session git.conf"
    "[workspace name:F12 silent;fullscreen;noanim] ${config.programs.kitty.package}/bin/kitty -T Clock --hold tty-clock -bscBrn"
    "${pkgs.networkmanagerapplet}/bin/nm-applet"
    "${config.services.copyq.package}/bin/copyq"
    ];
  };
}
