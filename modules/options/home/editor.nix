{
  config,
  lib,
  inputs,
  system,
  pkgs,
  ...
}:
let
  inherit (lib) types mkOption;
  cfg = config.env.editor;
in
{
  options.env.editor = {
    package = mkOption {
      type = types.nullOr types.package;
      default = null;
    };
    flags = mkOption {
      type = types.nullOr (types.listOf types.str);
      default = null;
    };
    extraPackages = mkOption {
      type = types.nullOr (types.listOf types.package);
      default = null;
    };
  };

config = {
  home = {
    packages = [
      cfg.extraPackages
      cfg.package
    ];
    sessionVariables.EDITOR =
      lib.getExe cfg.package + lib.optionalString
      (cfg.flags!=null)
      (" " + (builtins.concatStringsSep " " cfg.flags)
      );
  };
  };
}
