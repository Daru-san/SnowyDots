{
  description = "❄ A NixOS flake for all who love winter ❆";

  inputs = {
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-small.url = "github:nixos/nixpkgs/nixos-unstable-small";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Colors
    nix-colors.url = "github:Misterio77/nix-colors/b01f024090d2c4fc3152cd0cf12027a7b8453ba1";

    # Spiced spotify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Firefox addons
    firefox-addons.url = "git+https://gitlab.com/rycee/nur-expressions?dir=pkgs/firefox-addons";

    # Reall nice anime cli tool
    anipy-cli.url = "github:sdaqo/anipy-cli";

    # A nice idle inhibitor for hyprland
    vigiland.url = "github:jappie3/vigiland";

    # Featureful wayland launcher
    anyrun.url = "github:anyrun-org/anyrun";
    anyrun-shortcuts.url = "github:micha4w/anyrun-shell-shortcuts";
    anyrun-powermenu.url = "github:Daru-san/anyrun-powermenu";

    # Indexing for packages
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # My own repos
    r-pg.url = "github:Daru-san/r-pg";
    color-picker.url = "github:Daru-san/color-picker-rs";
    snowyvim.url = "sourcehut:~darumaka/SnowyVim";
    snowy-shell.url = "github:Daru-san/SnowyShell/niri";
    snowpkgs.url = "github:Daru-san/Snowpkgs";
    timed-rs.url = "github:Daru-san/timed-rs";
    walls = {
      url = "sourcehut:~darumaka/Wallpapers";
      flake = false;
    };

    # niri
    niri.url = "github:sodiboo/niri-flake";

    # hyprland
    hyprland.url = "github:hyprwm/Hyprland/v0.44.1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins/d05eb1ffba2ebffb5b4e1b407f134a4dcb411a88";
      inputs.hyprland.follows = "hyprland";
    };
    hyprscroller = {
      url = "github:dawsers/hyprscroller/ed725c5fd9c483372db44fb3414501e15cf5eab8";
      inputs.hyprland.follows = "hyprland";
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
        stateVersion = "24.11";
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
