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
    ;
  inherit (types)
    nullOr
    package
    listOf
    str
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
  };

  config = {
    home = {
      packages = flatten [
        cfg.extraPackages
        cfg.package
      ];
      sessionVariables.EDITOR =
        getExe cfg.package
        + optionalString (cfg.flags != null) (" " + (builtins.concatStringsSep " " cfg.flags));
    };
  };
}
