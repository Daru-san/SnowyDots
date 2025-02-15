{
  description = "❄ A NixOS flake for all who love winter ❆";

  inputs = {
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    stackpkgs.url = "github:ryze312/stackpkgs";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Themes
    tinted-themes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };

    # Theme manager
    stylix.url = "github:danth/stylix";

    # Spiced spotify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Firefox addons
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

    # Featureful wayland launcher
    anyrun.url = "github:anyrun-org/anyrun";

    # Indexing for packages
    nix-index-database = {
      url = "github:nix-community/nix-index-database/0ef970b7021e0ee9ab93437d0e28296e86669b03";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland idle inhibitor
    vigiland.url = "github:Jappie3/vigiland";

    # Zen browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    zenix = {
      url = "github:anders130/zenix";
      inputs.zen-browser.follows = "zen-browser";
    };

    # My own repos
    snowy-shell.url = "github:Daru-san/SnowyShell";
    rimi.url = "github:Daru-san/rimi";
    color-picker.url = "github:Daru-san/color-picker-rs";
    snowyvim.url = "sourcehut:~darumaka/SnowyVim";
    snowpkgs.url = "github:Daru-san/Snowpkgs";
    walls = {
      url = "sourcehut:~darumaka/Wallpapers";
      flake = false;
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      modules = {
        home = import ./modules/home;
        system = import ./modules/nixos;
        specialisations = import ./systems/specialise;
        overlays = import ./overlays;
      };

      desktop = {
        hostName = "Aria";
        config = ./systems/Aria;
        system = "x86_64-linux";
        stateVersion = "25.05";
      };

      laptop = {
        hostName = "Aurorus";
        config = ./systems/Aurorus;
        system = "x86_64-linux";
        stateVersion = "24.11";
      };
      systems = [
        "x86_64-linux"
      ];
      genSystems = nixpkgs.lib.genAttrs systems;
      pkgsFor = nixpkgs.legacyPackages;
    in
    {
      formatter = genSystems (
        system:
        let
          pkgs = pkgsFor."${system}";
        in
        pkgs.nixfmt-rfc-style
      );

      overlays = modules.overlays { inherit inputs; };

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
              system = {
                inherit (laptop) stateVersion;
              };
              networking = {
                inherit (laptop) hostName;
              };
              wayland.hyprland.enable = true;
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
              system = {
                inherit (desktop) stateVersion;
              };
              networking = {
                inherit (desktop) hostName;
              };
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
              home = {
                inherit (laptop) stateVersion;
              };
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
              home = {
                inherit (desktop) stateVersion;
              };
              wayland.enable = true;
            }
          ];
        };
      };
    };
}
