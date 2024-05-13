{
  description = "❄ My chilly NixOS flake for snowy nights and chilly afternoons ❆";

  inputs = {
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-alt.url = "github:Daru-san/nixpkgs/master";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

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
    grub-themes.url = "github:Daru-san/nixos-grub-themes";

    # My own repos
    snowyvim.url = "sourcehut:~darumaka/SnowyVim";
    scripts.url = "sourcehut:~darumaka/Nix-Scripts";
    snowpkgs.url = "sourcehut:~darumaka/Snowpkgs";
    wallpapers = {
      url = "sourcehut:~darumaka/Wallpapers";
      flake = false;
    };

    # Hyprland stuff
    hyprland.url = "github:hyprwm/Hyprland/v0.40.0";
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
    anyrun-nixos-options.url = "github:n3oney/anyrun-nixos-options";
    ags.url = "github:Aylur/ags";
  };
  nixConfig = {
    extra-substituters = [
      "https://anyrun.cachix.org"
      "https://nyx.chaotic.cx/"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://snowy-cache.cachix.org"
    ];
    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "snowy-cache.cachix.org-1:okWl5IF/yzdZ+p/eRhDFvcanQo/y0ta80dvfdGgy28U="
    ];
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = ["x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs systems;

    modules = {
      home = import ./modules/home;
      system = import ./modules/system;
      specialisations = import ./systems/specialise;
      pkgs = import ./pkgs;
    };
    laptop = {
      hostName = "Aurorus";
      config = ./systems/laptop;
      system = "x86_64-linux";
      stateVersion = "24.05";
    };
  in {
    overlays = modules.pkgs.overlays {inherit inputs;};
    packages =
      forAllSystems (system: modules.pkgs.packages nixpkgs.legacyPackages.${system});

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
            system = {inherit (laptop) stateVersion;};
            networking = {inherit (laptop) hostName;};
            wayland = {
              hyprland.enable = true;
              enable = true;
            };
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
          osConfig = self.nixosConfigurations.${laptop.hostName}.config;
        };
        modules = [
          ./home/daru
          modules.home
          {
            home = {inherit (laptop) stateVersion;};
            wayland = {
              enable = true;
              compositor = "hyprland";
            };
          }
        ];
      };
    };
  };
}
