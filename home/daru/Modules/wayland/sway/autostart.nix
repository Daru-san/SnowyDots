{pkgs, config, ...}:{
  wayland.windowManager.sway.config.startup = [
    { command = "systemctl --user start swaync.service"; }
    { command = "${config.services.copyq.package}/bin/copyq"; }
    { command = "${pkgs.autotiling-rs}/bin/autotiling-rs"; }
    { command = "systemctl --user restart kanshi"; always = true; }
    { command = "pkill waypaper && ${pkgs.waypaper} --restore"; always = true; }
  ];
}
