{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe getExe';
  kitty = getExe config.programs.kitty.package;
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "${kitty} -T Terminal"
      "${kitty} -T btop --hold ${getExe config.programs.btop.package}"
      (getExe config.programs.ags.package)
      (getExe pkgs.copyq)
      (getExe pkgs.rsibreak)
      (getExe pkgs.swww + " img ${config.wallpaperImage}")
    ];
    exec = [
      "systemctl --user restart kanshi.service"
    ];
  };
}
