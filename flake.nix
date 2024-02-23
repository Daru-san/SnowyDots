{
  description = "❄ My chilly NixOS flake for snowy nights and chilly afternoons ❆";
  nixConfig = {
    extra-substituters = ["https://anyrun.cachix.org"];
    extra-trusted-public-keys = ["anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="];
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

    # auto-cpufreq
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NUR Packages
    nur.url = "github:nix-community/NUR";

    # Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix/master";

    # Neovim nightly
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Prism launcher(Modded)
    prismlauncher.url = "github:Diegiwg/PrismLauncher-Cracked";

    # Firefox nightly
    firefox.url = "github:nix-community/flake-firefox-nightly";

    # Anyrun, a launcher for hyprland
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun-plugins = {
      url = "github:wuliuqii/anyrun-plugins";
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

    # Hyprland plugins
    hyprland.url = "github:hyprwm/Hyprland/v0.35.0";
    hycov = {
      url = "github:DreamMaoMao/hycov";
      inputs.hyprland.follows = "hyprland";
    };
    hyprfocus = {
      url = "github:VortexCoyote/hyprfocus";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
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
    # Supported systems for your flake packages, shell, etc.
    systems = ["x86_64-linux"];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages =
      forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter =
      forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration
    nixosConfigurations = {
      # Configuration on my Acer laptop
      # 'nixos-rebuild switch --flake .#AspireLaptop'
      AspireLaptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # > My main nixos configuration file <
          ./systems/AspireLaptop/default.nix
        ];
      };
    };
    homeConfigurations = {
      # My home configuration
      # 'home-manager switch --flake .#daru@AspireLaptop'
      "daru@AspireLaptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        # > My home configuration file <
        modules = [./home/daru/default.nix];
      };
    };
  };
}
