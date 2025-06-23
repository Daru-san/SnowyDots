{
  config,
  pkgs,
  lib,
  inputs,
  system,
  ...
}:
let
  inherit (lib) getExe;
  wezterm = getExe config.programs.wezterm.package;
  nshell = getExe inputs.nameless-shell.packages.${system}.default;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1] ${wezterm}"
      "[workspace 3] ${wezterm} -e ${getExe config.programs.btop.package}"
      (getExe pkgs.copyq)
      (getExe pkgs.soteria)
    ];
    exec = [
      nshell
    ];
  };
}
