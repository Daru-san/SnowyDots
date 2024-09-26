{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.wallpaperImage = mkOption {
    type = with types; nullOr path;
    default = null;
  };
}
