{
  config,
  ...
}:
let
  active = "0xff${config.colorScheme.colors.base07} 0xff${config.colorScheme.colors.base0B}";
  inactive = "0xff${config.colorScheme.colors.base03}";
  groupActive = "0xff${config.colorScheme.colors.base0A} 0xff${config.colorScheme.colors.base0C}";
  groupInactive = "0xff${config.colorScheme.colors.base0E}";
