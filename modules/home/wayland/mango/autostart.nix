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
      "${foot} --app-id btop -e ${osConfig.security.wrapperDir}/btop"
      (getExe pkgs.copyq)
      "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"
    ];
  };
}
