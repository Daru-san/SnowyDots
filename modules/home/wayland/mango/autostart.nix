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
    exec_once = [
      "${foot} -e ${osConfig.security.wrapperDir}/btop --app-id btop"
      (getExe pkgs.copyq)
      "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"
    ];
  };
}
