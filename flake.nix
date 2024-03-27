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
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.11";
    nur.url = "github:nix-community/NUR";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Custom stuff
    nix-colors.url = "github:Misterio77/nix-colors";
    spicetify-nix.url = "github:the-argus/spicetify-nix/master";
    trashy.url = "github:oberblastmeister/trashy";

    # My own repos
    snowyvim.url = "sourcehut:~darumaka/SnowyVim";
    scripts.url = "sourcehut:~darumaka/Nix-Scripts";
    snowpkgs.url = "sourcehut:~darumaka/Snowpkgs";

    # Hyprland stuff
    hyprland.url = "github:hyprwm/Hyprland/v0.37.1";
    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";
    hycov = {
      url = "github:Ayuei/hycov";
      inputs.hyprland.follows = "hyprland";
    };

    # Wayland stuff
    anyrun.url = "github:Kirottu/anyrun";
    anyrun-nixos-options.url = "github:n3oney/anyrun-nixos-options";
    ags.url = "github:Aylur/ags";
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
      pkgs = import ./pkgs;
    };
  in {
    overlays = modules.pkgs.overlays {inherit inputs;};

    nixosConfigurations = {
      AspireLaptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = with modules; [./systems/AspireLaptop system specialisations];
      };
    };

    homeConfigurations = {
      "daru@AspireLaptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = with modules; [./home/daru home];
      };
    };
  };
}
