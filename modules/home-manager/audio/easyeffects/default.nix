{ pkgs, lib, config, ... }:
let cfg = config.audio.easyeffects;
in with lib; {
  options = {
    audio.easyeffects.enable = mkOption {
      default = false;
      example = true;
      type = with types; bool;
    };
  };
  config = mkIf cfg.enable { services.easyeffects = { enable = true; }; };
}
