# System configurtion for Aspire A315 Laptop
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # NixOS modules
  imports = with outputs.nixosModules; [
    audio
    android-tools
    intel-gpu
    wayland
    greetd
    shells
    plymouth
    fonts
    neovim
  ] ++ [

    # System configurations
    ./Modules/boot.nix
    ./Modules/user.nix
    ./Modules/network.nix
    ./Modules/performance.nix
    ./Modules/programs.nix
    ./Modules/syncthing.nix
    ./Modules/scripts.nix

    # Hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {

    #Import nur pkgs
    config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };
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
  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";
  # Hostname
  networking.hostName = "AspireNix";

  system = {
    # Set to nixos-24.05
    stateVersion = "24.05";
    
    # Allow auto-upgrades to happen every day
    autoUpgrade = {
      enable = true;
      flake = "github:Daru-san/Snowflake-dots";
      flags = [
        "--update-input" "nixpkgs" "--commit-lock-file" "--impure"
      ];
      operation = "boot";
      dates = "00:00";
      randomizedDelaySec = "180min";
    };
  };
}
