# Custom packages
{pkgs, ...}: {
  # Pokeshell from acxz/pokeshell
  pokeshell = pkgs.callPackage ./pokeshell.nix {};

  # Bridge app for minecraft modding
  bridge-core = pkgs.callPackage ./bridge.nix {};

  # An audio mixer widget
  mixxc = pkgs.callPackage ./mixxc.nix {};

  # Zaread, a script that enables running zathura on with other file types
  zaread = pkgs.callPackage ./zaread.nix {};
}
