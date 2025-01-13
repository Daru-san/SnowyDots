{ lib, ... }:
let
  inherit (lib) mkOption types;
  monitoropts = {
    name = mkOption {
      type = types.str;
      example = "HDMI-A-1";
    };
    scale = mkOption {
      type = with types; either int float;
    };
  };
in
{
  options = {
    wayland.settings = {
      montors = lib.mkOption {
        type = types.listOf monitoropts;
      };
    };
  };
}
