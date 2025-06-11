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
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1] ${ghostty}"
      "[workspace 3] ${smitty} -e ${getExe config.programs.btop.package}"
      (getExe pkgs.copyq)
      (getExe pkgs.soteria)
    ];
  };
}
