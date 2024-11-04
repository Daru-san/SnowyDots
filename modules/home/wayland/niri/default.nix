{
  inputs,
  lib,
  config,
}:
{
  imports = [
    inputs.niri.homeModules.default
  ];
  programs.niri = {
    enable = true;

    settings.environment = lib.mapAttrsToList (
      name: value: "${name},${builtins.toString value}"
    ) config.home.sessionVariables;
  };
}
