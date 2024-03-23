{lib, ...}:
with lib; {
  options.wallpaperImage = {
    type = with types; nullOr path;
    default = null;
  };
}
