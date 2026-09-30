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
    package = pkgs.mango.overrideAttrs {
      version = "0-unstable-2026-09-15";
      src = pkgs.fetchFromGitHub {
        owner = "SDG-Den";
        repo = "mango";
        rev = "a74839c78c2f9160900dcc0c366bae2005e2aee6";
        hash = "sha256-xdQTvEtWPUHBVmeoLM80uXQvopAswqTPwv9T2QEBfT4=";
      };
    };
    systemd.enable = true;
  };
}
