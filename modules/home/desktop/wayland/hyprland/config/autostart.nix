{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
      "${config.programs.waybar.package}/bin/waybar"
    ];
    exec = [
      "systemctl --user restart kanshi.service"
    ];
  };
}
