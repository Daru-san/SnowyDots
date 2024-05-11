{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
      "${config.programs.waybar.package}/bin/waybar"
      "swww-daemon"
    ];
    exec = [
      "systemctl --user restart kanshi.service"
      "systemctl --user start lxpolkit"
      "swww img ${config.wallpaperImage}"
    ];
  };
}
