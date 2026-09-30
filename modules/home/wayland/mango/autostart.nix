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
      "${foot} -e ${osConfig.security.wrapperDir}/btop -t btop"
      (getExe pkgs.copyq)
      "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"
    ];
  };
}
