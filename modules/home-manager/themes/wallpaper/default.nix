{
  config
, lib
, ...
}:
let
  cfg = config.theme.wallpaper;
in 
with lib;
{
  options.theme.wallpaper = {
    image = mkOption {
      type = with types; nullOr path;
      default = null;
    };
    path = mkOption {
      type = with types; nullOr path;
      default = null;
    };
  };
}
