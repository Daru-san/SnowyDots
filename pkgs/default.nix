# Custom packages
pkgs: let
  pkgs = import <nixpkgs> {};
in 
{
  #Custom nix scripts
  nix-scripts = pkgs.callPackage ./nix-scripts.nix { };

  #Pokeshell from acxz/pokeshell 
  pokeshell = pkgs.callPackage ./pokeshell.nix { }; 
}
