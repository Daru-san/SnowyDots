{ lib, ... }:
let
  inherit (lib) types mkOption;
in
{
  options.colorSchemeCss = mkOption {
    type = with types; (either path str);
    default = null;
  };
}
