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

    # Nix-colors
    nix-colors.url = "github:Misterio77/nix-colors";

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
    modules = {
      home = import ./modules/home;
      system = import ./modules/system;
      specialisations = import ./systems/specialise;
      overlays = import ./overlays;
    };
  in {
    overlays = modules.overlays {inherit inputs;};

    nixosConfigurations = {
      AspireLaptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./systems/AspireLaptop modules.system modules.specialisations];
      };
    };

    homeConfigurations = {
      "daru@AspireLaptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/daru modules.home];
      };
    };
  };
}
