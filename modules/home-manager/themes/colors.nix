{lib, ...}:
with lib; {
  options.colorSchemeCss = {
    type = with types; (either path str);
    default = null;
  };
}
