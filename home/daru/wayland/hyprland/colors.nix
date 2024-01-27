{
  config,
  lib,
  ...
}:
let
  active = "0xff${config.colorScheme.colors.base07} 0xff${config.colorScheme.colors.base0B}";
  inactive = "0xff${config.colorScheme.colors.base03}";
  groupActive = "0xff${config.colorScheme.colors.base0A} 0xff${config.colorScheme.colors.base0C}";
  groupInactive = "0xff${config.colorScheme.colors.base0E}";
in
with lib;
{
  options.colors = {
    active = mkOption {
      type = with types; str;
      default = "${active}";
    };
    inactive = mkOption {
      type = with types; str;
      default = "${inactive}";
    };
    activeGroup = mkOption {
      type = with types; str;
      default = "${groupActive}";
    };
    inactiveGroup = mkOption {
      type = with types; str;
      default = "${groupInactive}";
    };
  };
}
