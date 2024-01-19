{
  pkgs,
  lib,
  config,
  inputs,
  outputs,
  ...
}:{

  # Import the main system configuration
  imports = [./configuration.nix] ++ (with outputs.nixosModules; [
    android
    audio
    fonts
    neovim
    shell
    system
    wayland
    ssh
  ]);

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      # outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];

    # Allow unfree packages
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  }; 
  # Allow auto-upgrades to happen every day
  system.autoUpgrade = {
    enable = true;
    flake = "github:Daru-san/Snowflake-dots";
    flags = [
      "--update-input" "nixpkgs" "--commit-lock-file" "--impure"
    ];
    operation = "boot";
    dates = "00:00";
    randomizedDelaySec = "180min";
  };
}