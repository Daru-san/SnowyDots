{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) getExe getExe';
  ghostty = getExe config.programs.kitty.package;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1] ${ghostty}"
      "[workspace 3] ${ghostty} -e ${getExe config.programs.btop.package}"
      (getExe pkgs.copyq)
    ];
  };
}
