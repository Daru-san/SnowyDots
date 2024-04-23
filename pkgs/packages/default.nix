{pkgs, ...}:
with pkgs; {
  zaread = callPackage ./zaread {};
  mixxc = callPackage ./mixxc {};
  bridge-core = callPackage ./bridge {};
}
