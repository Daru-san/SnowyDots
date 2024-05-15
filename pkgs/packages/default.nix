{pkgs, ...}:
with pkgs; {
  zaread = callPackage ./zaread {};
  bridge-core = callPackage ./bridge {};
  gh-s = callPackage ./gh-s {};
  gh-download = callPackage ./gh-download {};
}
