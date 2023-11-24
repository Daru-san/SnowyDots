{pkgs, networking, ...}: let
   nix-rebuild = pkgs.writeScriptBin "nix-rebuild" (import ./Scripts/nix-rebuild.nix { inherit networking; });
in {
  imports = [
    ./Scripts/nv-clone.nix
  ];
  environment.systemPackages = [
    nix-rebuild
  ];
}
