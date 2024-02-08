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
      type = with types; path or str;
      default = "./base-wall.png";
    };
  };
}
