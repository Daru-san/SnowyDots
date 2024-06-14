{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe;
  kitty = getExe config.programs.kitty.package;
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1] ${kitty} -T Terminal"
      "[workspace 3] ${kitty} -T btop --detach ${getExe config.programs.btop.package}"
      "[workspace 8] ${kitty} --detach ${getExe pkgs.dooit}"
      (getExe config.programs.ags.package)
      (getExe pkgs.copyq)
    ];
    exec = [
      "systemctl --user restart kanshi.service"
      "systemctl --user restart hyprpaper.service"
    ];
  };
}
