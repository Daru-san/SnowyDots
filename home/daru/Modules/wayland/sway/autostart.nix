{pkgs, config, ...}:{
  wayland.windowManager.sway.config.startup = [
    { command = "systemctl --user start swaync.service"; }
    { command = "${config.services.copyq.package}/bin/copyq"; }
    { command = "${config.programs.waybar.package}/bin/waybar"; }
  ];
}
