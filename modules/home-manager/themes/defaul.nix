{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  cfg = config.colorScheme;
in  
with lib;
{
  imports = [inputs.nix-colors.homeManagerModules.default];
  options = {
    colorScheme = mkOption {
      types = with types; nullOr ([ "gruvbox" "vibrant-green" "" ]) 
    };
  };
  config = {

  };
}
