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

  home = {
    packages = [
      cfg.extraPackages
      cfg.package
    ];
    editor =
      lib.getExe cfg.package + lib.optional cfg.flags (" " + (builtins.concatStringsSep " " cfg.flags));
  };
}
