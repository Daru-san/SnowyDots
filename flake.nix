{
  description = "❄ My chilly NixOS flake for snowy nights and chilly afternoons ❆";

  inputs = {
    # Nixpkgs repos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-alt.url = "github:Daru-san/nixpkgs/master";
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
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock/v0.3.0";
    hypridle.url = "github:hyprwm/hypridle/v0.1.2";
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprfocus = {
      url = "github:pyt0xic/hyprfocus";
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
    nixpkgs-stable,
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
  in {
    overlays = modules.pkgs.overlays {inherit inputs;};
    packages =
      forAllSystems (system: modules.pkgs.packages nixpkgs.legacyPackages.${system});

    nixosConfigurations = {
      AspireLaptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = with modules; [
          ./systems/AspireLaptop
          system
          {
            wayland = {
              hyprland.enable = true;
              enable = true;
            };
          }
        ];
      };
      AspireDesktop = nixpkgs-stable.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./systems/AspireDesktop
          modules.system
          {services.xserver.enable = true;}
        ];
      };
    };

    homeConfigurations = {
      "daru@AspireLaptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs outputs;
          osConfig = self.nixosConfigurations.AspireLaptop.config;
          system = "x86_64-linux";
        };
        modules = [
          ./home/daru
          modules.home
          {
            wayland = {
              enable = true;
              compositor = "hyprland";
            };
            home.stateVersion = "24.05";
          }
        ];
      };
      "daru@AspireDesktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs-stable.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/daru
          modules.home
          {
            xsession.enable = true;
            home.stateVersion = "23.11";
          }
        ];
      };
    };
  };
}
