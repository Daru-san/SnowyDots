{
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}: {
  imports = lib.flatten [
    [./home.nix ./theme ./packages.nix ./misc.nix ./scripts.nix]
    (with inputs; [nix-colors.homeManagerModules.default])
  ];

  nixpkgs = {
    overlays = lib.flatten [
      (with inputs; [
        snowpkgs.overlays.default
        snowyvim.overlays.default
      ])
      (with outputs.overlays; [
        stable-packages
        unstable-packages
      ])
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
  nix.package = pkgs.nixVersions.latest;
  nix.gc = {
    automatic = true;
    frequency = "daily";
  };
}
