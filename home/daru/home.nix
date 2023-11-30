## My home configuration file ##
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Import nix-colors module
    inputs.nix-colors.homeManagerModules.default

    # Import spicetify module
    inputs.spicetify-nix.homeManagerModules.default

    # Import my custom easyeffects module
    outputs.homeManagerModules.easyeffects

    # Import home configs
    ./Modules/default.nix
  ];

  nixpkgs = {
    overlays = [

      # 
      outputs.overlays.additions

      # Package modifications
      # outputs.overlays.modifications

      # Overlay for stable packages (23.05)
      outputs.overlays.stable-packages

      # Neovim nightly overlay
      inputs.neovim-nightly-overlay.overlays.default

    ];


    config = {
      # Allowing unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "daru";
    homeDirectory = "/home/daru";
  };


  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
