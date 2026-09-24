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
  wayland.windowManager.mango.settings = {
    exec-once = [
      "[workspace 3] ${foot} -e ${osConfig.security.wrapperDir}/btop -t btop"
      (getExe pkgs.copyq)
      (getExe pkgs.noctalia-shell)
      "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"
    ];
  };
}
