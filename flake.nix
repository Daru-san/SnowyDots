{
  description = "❄ A NixOS flake for all who love winter ❆";

  inputs = {
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nyx.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Colors
    nix-colors.url = "github:Misterio77/nix-colors/b01f024090d2c4fc3152cd0cf12027a7b8453ba1";

    # Spiced spotify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Trash can
    trashy.url = "github:Daru-san/trashy";

    # Firefox addons
    firefox-addons.url = "git+https://gitlab.com/rycee/nur-expressions?dir=pkgs/firefox-addons";

    # Reall nice anime cli tool
    anipy-cli.url = "github:sdaqo/anipy-cli";

    # Wayland shell
    ags.url = "github:Aylur/ags/";

    # Featureful wayland launcher
    anyrun.url = "github:anyrun-org/anyrun";
    anyrun-shortcuts.url = "github:micha4w/anyrun-shell-shortcuts";
    anyrun-powermenu.url = "github:Daru-san/anyrun-powermenu";

    # hyprland
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      rev = "9a09eac79b85c846e3a865a9078a3f8ff65a9259";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprscroller = {
      url = "github:dawsers/hyprscroller";
      inputs.hyprland.follows = "hyprland";
    };

    # Indexing for packages
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # My own repos
    r-pg.url = "github:Daru-san/r-pg";
    color-picker.url = "github:Daru-san/color-picker-rs";
    snowyvim.url = "sourcehut:~darumaka/SnowyVim";
    snowpkgs.url = "sourcehut:~darumaka/Snowpkgs";
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
      hostName = "Aggron";
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
