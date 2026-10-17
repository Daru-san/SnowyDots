{
  inputs,
  system,
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
    ./settings.nix
  ];
  wayland.windowManager.mango = {
    package = inputs.mango.packages.${system}.mango;
    systemd = {
      enable = true;
      xdgAutostart = true;
    };
  };
}
