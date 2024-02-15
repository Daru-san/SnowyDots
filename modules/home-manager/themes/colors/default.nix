{
  lib,
  config,
  ...
}: let
  cfg = config.theme.colorScheme;
in
  with lib; {
    options.theme.colorScheme = {
      css = mkOption {
        type = with types; nullOr path;
        default = null;
      };
    };
  }
