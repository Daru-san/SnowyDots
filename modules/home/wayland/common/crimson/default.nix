{ inputs, ... }:
{
  imports = [
    inputs.crimson.homeModules.default
  ];
  programs.crimson = {
    systemd.enable = true;
  };
}
