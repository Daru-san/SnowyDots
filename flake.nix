{
  description = "My NixOS configuration rebuilt ft. Hyprland and flakes";

  inputs = {

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    #Add unstable packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #Nix-hardware
    hardware.url = "github:nixos/nixos-hardware";

    #GRUB theme
    grub-themes.url = "github:vinceliuice/grub2-themes";

    # Colors
    nix-colors.url = "github:misterio77/nix-colors";

    #NUR Packages
    nur.url = "github:nix-community/NUR";

    #Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix/master";

    ##Hyprland##
    hyprland = {
      #Add Hyprland to home config
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      #Hyprland-contrib for hyprland specific packages
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Neovim nightly
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    #Prism launcher
    prismlauncher.url = "github:Diegiwg/PrismLauncher-Cracked";

    #Firefox nightly
    firefox.url = "github:nix-community/flake-firefox-nightly";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    spicetify-nix,
    grub-themes,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

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
      #'nixos-rebuild --flake .#AspireNixRebuilt'
      AspireNixRebuilt = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs grub-themes hyprland spicetify-nix;};
        modules = [
          # > Our main nixos configuration file <
          ./nixos/configuration.nix
          hyprland.nixosModules.default
          grub-themes.nixosModule
        ];
      };
    };
  };
}
