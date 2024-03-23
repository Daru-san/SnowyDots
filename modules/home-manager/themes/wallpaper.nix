{lib, ...}:
with lib; {
  options.wallpaperImage = mkOption {
    type = with types; nullOr path;
    default = null;
  };
}
