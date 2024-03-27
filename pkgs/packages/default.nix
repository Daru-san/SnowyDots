{pkgs, ...}:
with pkgs; {
  zaread = callPackage ./zaread {};
  mixxc = callPackage ./mixxc {};
  bridge = callPackage ./bridge {};
}
