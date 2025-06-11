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
  ghostty = getExe config.programs.ghostty.package;
  smitty = getExe inputs.smitty.packages.${system}.smitty;
  wezterm = getExe config.programs.wezterm.package;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1] ${wezterm}"
      "[workspace 3] ${wezterm} -e ${getExe config.programs.btop.package}"
      (getExe pkgs.copyq)
      (getExe pkgs.soteria)
    ];
  };
}
