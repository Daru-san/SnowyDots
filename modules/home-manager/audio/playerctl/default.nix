{ 
  pkgs,
  lib,
  config,
  ... 
}:
let
  cfg = config.audio.playerctl;
in 
with lib;
{
  options = {
    audio.playerctl.enable = mkOption {
      default = false;
      example = true;
      type = with types; bool;
    };
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ playerctl ];
    services.playerctld = {
      enable = true;
    };
  };
}
