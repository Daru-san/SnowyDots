{
  lib,
  config,
  inputs,
  outputs,
  ...
}:
{
  imports = [ ./configuration.nix ];
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];
    config.allowUnfree = true;
  };

  nix = {
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
      lib.filterAttrs (_: lib.isType "flake") inputs
    );
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
      "nixos-config=${./configuration.nix}"
    ];
  };
  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  nix.settings = {
    trusted-users = [
      "root"
      "daru"
    ];
    builders-use-substitutes = true;
    substituters = [
      "https://aseipp-nix-cache.global.ssl.fastly.net"
      "https://nix-community.cachix.org"
      "https://cache.garnix.io"
      "https://unmojang.cachix.org"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "unmojang.cachix.org-1:OfHnbBNduZ6Smx9oNbLFbYyvOWSoxb2uPcnXPj4EDQY="
    ];
  };
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    operation = "boot";
    dates = "00:00";
    persistent = true;
    randomizedDelaySec = "180min";
  };
}
