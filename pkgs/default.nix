# Custom packages
pkgs: {
  # example = pkgs.callPackage ./example { };
  #Custom nix-rebuild script
  nix-rebuild = pkgs.writeScriptBin "nix-rebuild" (import ./Scripts/nix-rebuild.nix);
}
