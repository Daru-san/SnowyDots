{pkgs, config, ...}:{
  wayland.windowManager.sway.config.startup = {
    swaync = {
      command = "systemctl --user start swaync.service";
    };
    copyq = {
      command = "${config.services.copyq.package}/bin/copyq";
    };
    waybar = {
      command = "${config.programs.waybar.package}/bin/waybar";
    };
  };
}
