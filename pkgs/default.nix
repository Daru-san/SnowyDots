# Custom packages
pkgs: {
  #Custom nix-rebuild script
  nix-rebuild = pkgs.callPackage ./nix-rebuild.nix { };

  #Pokeshell from acxz/pokeshell 
  pokeshell = pkgs.callPackage ./pokeshell.nix { }; 
}
