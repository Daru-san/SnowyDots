{pkgs, ...}:
with pkgs; {
  zaread = callPackage ./zaread {};
  bridge-core = callPackage ./bridge {};
}
