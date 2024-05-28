{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace name:1] ${config.programs.kitty.package}/bin/kitty -T Terminal"
      "${config.programs.waybar.package}/bin/waybar"
      "${pkgs.copyq}/bin/copyq"
      "${inputs.matcha.packages.${system}.default}/bin/matcha -d --off"
    ];
    exec = [
      "systemctl --user restart kanshi.service"
      "systemctl --user restart hyprpaper.service"
    ];
  };
}
