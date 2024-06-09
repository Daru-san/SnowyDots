{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
      "[workspace name:2] ${config.programs.kitty.package}/bin/kitty -T btop --hold ${config.programs.btop.package}/bin/btop"
      "${config.programs.waybar.package}/bin/waybar"
      "${pkgs.copyq}/bin/copyq"
    ];
    exec = [
      "systemctl --user restart kanshi.service"
      "systemctl --user restart hyprpaper.service"
    ];
  };
}
