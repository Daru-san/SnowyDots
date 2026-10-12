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
    ./settings.nix
  ];
  wayland.windowManager.mango = {
    package = pkgs.mango.overrideAttrs (_: rec {
      version = "0.18.0";
      src = pkgs.fetchFromGitHub {
        owner = "mangowm";
        repo = "mango";
        tag = version;
        hash = "sha256-gRe1QxNkNZ0mriIuQqS5RDCnuXNroHcNY0fJiLwGVmc=";
      };
    });
    systemd.enable = true;
  };
}
