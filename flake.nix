{
  description = "❄ A NixOS flake for all who love winter ❆";

  inputs = {
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

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

    pascal-lsp = {
      url = "github:Daru-san/pascal-language-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kotlin-lsp = {
      url = "github:turtton/kotlin-lsp-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

    fjord-launcher = {
      url = "github:Daru-san/FjordLauncherUnlocked";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #secrets
    sops-nix.url = "github:Mic92/sops-nix";

    # Theme manager
    stylix.url = "github:nix-community/stylix";

    # Spiced spotify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Firefox addons
    firefox-addons.url = "gitlab:rycee/nur-expressions/?dir=pkgs/firefox-addons";

    # Indexing for packages
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
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
    frostpak.url = "github:Daru-san/frostpak";
    scarlet.url = "sourcehut:~darumaka/scarlet/0.4.1";
    vim.url = "sourcehut:~darumaka/SnowyVim";
    musnix.url = "github:musnix/musnix";
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
        hostName = "Kanji";
        config = ./systems/Kanji;
        system = "x86_64-linux";
        stateVersion = "26.11";
      };

      laptop = {
        hostName = "Rintaro";
        config = ./systems/Rintaro;

        system = "x86_64-linux";
        stateVersion = "26.11";
      };

      systems = [
        "x86_64-linux"
      ];
      stylix = ./stylix.nix;
      genSystems = nixpkgs.lib.genAttrs systems;
      pkgsFor = nixpkgs.legacyPackages;
      lib = nixpkgs.lib;
    in
    {
      formatter = genSystems (
        system:
        let
          pkgs = pkgsFor."${system}";
        in
        pkgs.nixfmt
      );

      overlays = modules.overlays { inherit inputs; };

      nixosConfigurations = {
        ${desktop.hostName} = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            inherit (desktop) system;
          };
          modules = [
            desktop.config
            modules.system
            stylix
            {
              nixpkgs.hostPlatform = desktop.system;
              system = {
                inherit (desktop) stateVersion;
              };
              system.ai = {
                enable = true;
                large = true;
                ollama = {
                  package =
                    let
                      pkgs = import nixpkgs { inherit (desktop) system; };
                    in
                    pkgs.ollama;
                  extraVars = {
                    OLLAMA_NUM_PARALLEL = "1";
                    OMP_NUM_THREADS = "4";
                  };
                };
              };
              networking = {
                inherit (desktop) hostName;
              };
              wayland.enable = true;
            }
          ];
        };
        "${laptop.hostName}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            inherit (laptop) system;
          };
          modules = [
            laptop.config
            modules.system
            stylix
            {
              nixpkgs.hostPlatform = laptop.system;
              system.laptop = true;
              system.ai = {
                enable = true;
                small = true;
              };
              system = {
                inherit (laptop) stateVersion;
              };
              networking = {
                inherit (laptop) hostName;
              };
              wayland.enable = true;
            }
          ];
        };
      };

      homeConfigurations = {
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
            stylix
            {
              home = {
                inherit (desktop) stateVersion;
              };
              wayland.enable = true;
              imports = [ inputs.noctalia.homeModules.default ];
              programs.noctalia-shell.enable = true;
            }
          ];
        };
        "daru@${laptop.hostName}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${laptop.system};
          extraSpecialArgs = {
            inherit inputs outputs;
            inherit (laptop) system;
            osConfig = self.nixosConfigurations.${laptop.hostName}.config;
          };
          modules = [
            ./home/daru
            modules.home
            stylix
            {
              home = {
                inherit (laptop) stateVersion;
              };
              wayland.enable = true;
              imports = [ inputs.noctalia.homeModules.default ];
              programs.noctalia-shell.enable = true;
            }
          ];
        };
      };
    };
}
