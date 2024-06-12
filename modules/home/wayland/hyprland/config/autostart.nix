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
      "[workspace 0] ${kitty} -T btop --hold ${getExe config.programs.btop.package}"
      "[workspace 4;group] ${kitty} --hold ${getExe pkgs.vnstat}"
      "[workspace 4,group] ${kitty} --hold ${getExe pkgs.bandwhich}"
      (getExe config.programs.ags.package)
      (getExe pkgs.copyq)
    ];
    exec = [
      "systemctl --user restart kanshi.service"
      "systemctl --user restart hyprpaper.service"
    ];
  };
}
