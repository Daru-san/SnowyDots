# System configurtion for Aspire A315 Laptop
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    #NixOS System Modules
    ./Modules/boot.nix
    ./Modules/audio.nix
    ./Modules/shell.nix
    ./Modules/users.nix
    ./Modules/android.nix
    ./Modules/desktop.nix
    ./Modules/network.nix
    ./Modules/systemd.nix
    ./Modules/performance.nix
    ./Modules/hardware.nix
    ./Modules/systemPackages.nix
    ./Modules/Sync.nix
    ./Modules/scripts.nix

    # Hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here

    #Import nur pkgs
    config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
#      outputs.overlays.modifications
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

  # Pin to NixOS 23.05
  system.stateVersion = "24.05";
}
