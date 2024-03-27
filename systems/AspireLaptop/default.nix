{
  lib,
  config,
  inputs,
  outputs,
  ...
}: {
  imports = [./configuration.nix];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.stable-packages
    ];
    config = {allowUnfree = true;};
  };

  nix.registry =
    (lib.mapAttrs (_: flake: {inherit flake;}))
    ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs' (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  nix.settings = {
    builders-use-substitutes = true;
    substituters = [
      "https://anyrun.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  system.autoUpgrade = {
    enable = true;
    flake = "github:Daru-san/Snowflake-dots";
    flags = ["--update-input" "nixpkgs" "--impure"];
    operation = "boot";
    dates = "00:00";
    randomizedDelaySec = "180min";
  };
}
