{
  description = "❄ A NixOS flake for all who love winter ❆";

  inputs = {
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    nixpkgs-small.url = "github:nixos/nixpkgs/nixos-unstable-small";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # Themes
    tinted-themes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };

    pascal-gtk-bindings = {
      url = "github:Daru-san/pascal-gtk4-bindings";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pascal-lsp = {
      url = "github:Daru-san/pascal-language-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

    # Pascal development tools
    pascal-tools = {
      url = "sourcehut:~darumaka/nix-pascal-tools";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/v0.6.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #secrets
    sops-nix.url = "github:Mic92/sops-nix";

    yazi.url = "github:sxyazi/yazi/v25.5.31";

    # Theme manager
    stylix.url = "github:nix-community/stylix";

    # Spiced spotify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Firefox addons
    firefox-addons.url = "gitlab:rycee/nur-expressions/?dir=pkgs/firefox-addons";

    # Featureful wayland launcher
    anyrun.url = "github:anyrun-org/anyrun/v25.9.3";

    popup-kak = {
      url = "github:enricozb/popup.kak";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kak-tree-sitter-helix = {
      url = "github:Daru-san/kak-tree-sitter-helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazelix.url = "github:Daru-san/yazelix/merged";
    yazelix-hm = {
      url = "github:Daru-san/yazelix/merged?dir=home_manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Indexing for packages
    nix-index-database = {
      url = "github:nix-community/nix-index-database/0ef970b7021e0ee9ab93437d0e28296e86669b03";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-findbar = {
      url = "github:RobotoSkunk/zen-better-findbar";
      flake = false;
    };

    seanime = {
      url = "github:Rishabh5321/seanime-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # My own repos
    waycute.url = "sourcehut:~darumaka/waycute";
    snowy-shell.url = "github:Daru-san/SnowyShell";
    vim.url = "sourcehut:~darumaka/SnowyVim";
    rimi.url = "github:Daru-san/rimi";
    color-picker.url = "github:Daru-san/color-picker-rs";
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
        stateVersion = "26.05";
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
            osConfig = self.nixosConfigurations.${desktop.hostName}.config;
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
