{
  description = "❄ My chilly NixOS flake for snowy nights and chilly afternoons ❆";
  nixConfig = {
    extra-substituters = [
      "https://anyrun.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  inputs = {
    # Unstable packages from 24.05
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Stable packages, from 23.11
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.11";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NUR Packages
    nur.url = "github:nix-community/NUR";

    # Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix/master";

    # My custom neovim configuration for nix
    snowyvim.url = "sourcehut:~darumaka/SnowyVim";

    # Firefox nightly
    firefox.url = "github:nix-community/flake-firefox-nightly";

    # Trashy
    trashy.url = "github:oberblastmeister/trashy";

    # Anyrun, a launcher for hyprland
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun-nixos-options.url = "github:n3oney/anyrun-nixos-options";

    # ags, a gtk shell for hyprland
    ags.url = "github:Aylur/ags";

    # Custom scripts of mine that I use normally
    scripts = {
      url = "sourcehut:~darumaka/Nix-Scripts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # My custom packages in one repo
    snowpkgs = {
      url = "sourcehut:~darumaka/Snowpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland and plugins
    hyprland.url = "github:hyprwm/Hyprland/v0.37.1";
    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";
    hycov = {
      url = "github:Ayuei/hycov";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    # Supported systems
    systems = ["x86_64-linux"];

    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;

    # Import packages and overlays at once
    pkgs = import ./pkgs;
  in {
    # Custom packages
    packages =
      forAllSystems (system: pkgs.packages nixpkgs.legacyPackages.${system});

    # Your custom packages and modifications, exported as overlays
    overlays = pkgs.overlays {inherit inputs;};

    # NixOS modules to be used by the system configuration
    nixosModules = import ./modules/nixos;

    # Home-manager modules to be used by home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration
    nixosConfigurations = {
      # Configuration on my Acer laptop
      # 'nixos-rebuild switch --flake .#AspireLaptop'
      AspireLaptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # > My main nixos configuration file <
          ./systems/AspireLaptop
          # > Specialisations for custom boot entries <
          ./systems/specialise
        ];
      };
    };

    # Home configuration
    homeConfigurations = {
      # My home configuration for Hyprland
      # 'home-manager switch --flake .#daru@AspireLaptop'
      "daru@AspireLaptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          # > Main home configuration file <
          ./home/daru
          # > Shared home options <
          ./home/shared
        ];
      };
    };
  };
}
