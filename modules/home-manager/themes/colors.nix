{lib, ...}:
with lib; {
  options.colorSchemeCss = mkOption {
    type = with types; (either path str);
    default = null;
  };
}
