# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    inputs.nix-colors.homeManagerModules.default

    inputs.spicetify-nix.homeManagerModules.default
    #Add nur
    inputs.nur.nixosModules.nur

      #Import home configs
     ./Modules/default.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      inputs.neovim-nightly-overlay.overlays.default

    ];


    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;

      # packageOverrides = pkgs: {
      #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      #     inherit pkgs;
      #   };
      # };
    };
  };

  home = {
    username = "daru";
    homeDirectory = "/home/daru";
    sessionVariables = {
        repo = "~/snowflake/";
      };
  };


  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
