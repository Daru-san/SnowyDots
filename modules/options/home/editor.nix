{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkOption
    flatten
    optionalString
    getExe
    types
    mkIf
    ;
  inherit (types)
    nullOr
    package
    listOf
    str
    bool
    ;
  cfg = config.env.editor;
in
{
  options.env.editor = {
    package = mkOption {
      type = nullOr package;
      default = null;
    };
    flags = mkOption {
      type = nullOr (listOf str);
      default = null;
    };
    extraPackages = mkOption {
      type = nullOr (listOf package);
      default = null;
    };
    defaultEditor = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf (cfg.package != null) {
    home = {
      packages = flatten [
        cfg.extraPackages
        cfg.package
      ];
      sessionVariables.EDITOR = mkIf cfg.defaultEditor (
        getExe cfg.package
        + optionalString (cfg.flags != null) (" " + (builtins.concatStringsSep " " cfg.flags))
      );
    };
  };
}
