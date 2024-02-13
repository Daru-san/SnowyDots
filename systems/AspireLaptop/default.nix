{ pkgs, lib, config, inputs, outputs, ... }: {

  # Import the main system configuration
  imports = [ ./configuration.nix ] ++ (with outputs.nixosModules; [
    android
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
    config = { allowUnfree = true; };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; }))
    ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  # Build substituters for hyprland and anyrun to prevent local building
  nix.settings = {
    builders-use-substitutes = true;
    # substituters to use
    substituters =
      [ "https://anyrun.cachix.org" "https://hyprland.cachix.org" ];

    trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  # Allow auto-upgrades to happen every day
  system.autoUpgrade = {
    enable = true;
    flake = "github:Daru-san/Snowflake-dots";
    flags = [ "--update-input" "nixpkgs" "--impure" ];
    operation = "boot";
    dates = "00:00";
    randomizedDelaySec = "180min";
  };
}
