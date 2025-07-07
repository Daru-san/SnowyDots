{
  config,
  pkgs,
  lib,
  sysconfig,
  ...
}:
let
  inherit (lib) getExe;
  foot = getExe config.programs.foot.package;
  # nshell = getExe inputs.nameless-shell.packages.${system}.default;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1] ${foot}"
      "[workspace 3] ${foot} -e ${sysconfig.security.wrapperDir}/btop"
      (getExe pkgs.copyq)
      (getExe pkgs.soteria)
    ];
    # exec = [
    #   nshell
   # ];
  };
}
