{
  description = "❄ A NixOS flake for all who love winter ❆";

  inputs = {
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Custom stuff
    nix-colors.url = "github:Misterio77/nix-colors";
    spicetify-nix.url = "github:Daru-san/spicetify-nix";
    trashy.url = "github:Daru-san/trashy";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # My own repos
    snowyvim.url = "sourcehut:~darumaka/SnowyVim";
    scripts.url = "sourcehut:~darumaka/Nix-Scripts";
    snowpkgs.url = "sourcehut:~darumaka/Snowpkgs";
    wallpapers = {
      url = "sourcehut:~darumaka/Wallpapers";
      flake = false;
    };

    # Hyprland stuff
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hycov = {
      url = "github:DreamMaoMao/hycov";
      inputs.hyprland.follows = "hyprland";
    };

    # Wayland stuff
    anyrun.url = "github:Kirottu/anyrun";
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
      system = import ./modules/nixos;
      specialisations = import ./systems/specialise;
      overlays = import ./overlays;
    };
    desktop = {
      hostName = "Articuno";
      config = ./systems/desktop;
      system = "x86_64-linux";
      stateVersion = "24.11";
    };
    laptop = {
      hostName = "Aurorus";
      config = ./systems/laptop;
      system = "x86_64-linux";
      stateVersion = "24.11";
    };
  in {
    overlays = modules.overlays {inherit inputs;};

    nixosConfigurations = {
      ${laptop.hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
          inherit (laptop) system;
        };
        modules = [
          laptop.config
          modules.system
          {
            nixpkgs.hostPlatform = laptop.system;
            system = {inherit (laptop) stateVersion;};
            networking = {inherit (laptop) hostName;};
            wayland.enable = true;
          }
        ];
      };
      ${desktop.hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
          inherit (desktop) system;
        };
        modules = [
          desktop.config
          modules.system
          {
            nixpkgs.hostPlatform = desktop.system;
            system = {inherit (desktop) stateVersion;};
            networking = {inherit (desktop) hostName;};
            wayland.enable = true;
          }
        ];
      };
    };

    homeConfigurations = {
      "daru@${laptop.hostName}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${laptop.system};
        extraSpecialArgs = {
          inherit inputs outputs;
          inherit (laptop) system;
        };
        modules = [
          ./home/daru
          modules.home
          {
            home = {inherit (laptop) stateVersion;};
            wayland.enable = true;
          }
        ];
      };
      "daru@${desktop.hostName}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${desktop.system};
        extraSpecialArgs = {
          inherit inputs outputs;
          inherit (desktop) system;
        };
        modules = [
          ./home/daru
          modules.home
          {
            home = {inherit (desktop) stateVersion;};
            wayland.enable = true;
          }
        ];
      };
    };
  };
}
