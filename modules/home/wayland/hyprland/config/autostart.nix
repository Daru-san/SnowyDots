{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
let
  inherit (lib) getExe;
  foot = getExe config.programs.foot.package;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1] ${foot}"
      "[workspace 3] ${foot} -e ${osConfig.security.wrapperDir}/btop"
      (getExe pkgs.copyq)
      (getExe pkgs.soteria)
    ];
  };
}
