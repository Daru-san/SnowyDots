{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.mango.hmModules.mango
    ./colors.nix
    ./binds.nix
    ./autostart.nix
    ./rules.nix
    ./input.nix
    ./style.nix
  ];
  wayland.windowManager.mango = {
    package = pkgs.mango;
    systemd.enable = true;
  };
}
