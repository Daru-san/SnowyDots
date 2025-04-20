{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) getExe;
  ghostty = getExe config.programs.ghostty.package;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1] ${ghostty}"
      "[workspace 3] ${ghostty} -e ${getExe config.programs.btop.package}"
    ];
  };
}
