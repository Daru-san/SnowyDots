{ inputs, outputs, pkgs, ... }: {
  imports = [
    # Import home-manager's NixOS module
    inputs.home-manager.nixosModules.home-manager
  ];
  #This is to allow home manager to be managed by the system and not on it's own
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Home configuration
      daru = import ../../home-manager/home.nix;
    };
  };

  #User configurations
  users = {
    users = {
      #My main user
      daru = {
        isNormalUser = true;
        shell = pkgs.zsh;
        description = "Daru";
        extraGroups = [ "networkmanager" "wheel" "video" "adbusers" "input"];
      };
      #Disables root user
      root.hashedPassword = "!";
    };
    mutableUsers = true;
  };
}
