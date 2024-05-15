{pkgs, ...}:
with pkgs; {
  zaread = callPackage ./zaread {};
  bridge-core = callPackage ./bridge {};
  gh-s = callPackage ./gh-s {};
  gh-download = callPackage ./gh-download {};

  bluetooth-tui = callPackage ./bluetooth-tui {};
  network-tui = callPackage ./network-tui {};
  clipboard-tui = callPackage ./clipboard-tui {};
}
