# Custom packages
pkgs: let
  pkgs = import <nixpkgs> {};
in 
{
  #Custom nix-rebuild script
  nix-rebuild = pkgs.callPackage ./nix-rebuild.nix { };

  #Pokeshell from acxz/pokeshell 
  pokeshell = pkgs.callPackage ./pokeshell.nix { }; 
}
