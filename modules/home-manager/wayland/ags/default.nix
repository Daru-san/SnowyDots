{ 
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.wayland.ags;
in 
with lib;
{
  imports = [ inputs.ags.homeManagerModules.default ];
  options = {
    wayland.ags.enable = mkOption {
      default = false;
      type = with types; bool;
      example = true;
    };
  };
  config = {
    programs.ags = {
      # Enable ags
      enable = true;

      # packages to add to gjs's runtime
      extraPackages = [ pkgs.libsoup_3 ];
    };
  };
}
