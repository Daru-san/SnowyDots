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
      inputs.snowpkgs.overlays.default
      outputs.overlays.stable-packages
    ];
    config.allowUnfree = true;
  };

  system.rebuild.enableNg = true;
  nix = {
    # package = pkgs.nixVersions.latest;
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
      "https://snowy-cache.cachix.org"
      "https://anyrun.cachix.org"
      "https://cache.garnix.io"
      "https://helix.cachix.org"
      "https://yazi.cachix.org"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "snowy-cache.cachix.org-1:okWl5IF/yzdZ+p/eRhDFvcanQo/y0ta80dvfdGgy28U="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
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
