{
  pkgs,
  inputs,
  lib,
  ...
}:
with lib; let
  cfg = config.wayland.ags;
in {
  imports = [inputs.ags.homeManagerModules.default];
  options.wayland.ags.enable = mkEnableOption "Enable ags";
  config.programs.ags = mkIf cfg.enable {
    enable = true;
    extraPackages = with pkgs; [sassc libsoup_3];
  };
}
