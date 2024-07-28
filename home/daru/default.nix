{
  inputs,
  outputs,
  lib,
  ...
}: {
  imports = lib.flatten [
    [./home.nix ./theme ./packages.nix ./scripts.nix]
    (with inputs; [nix-colors.homeManagerModules.default])
  ];

  nixpkgs = {
    overlays = lib.flatten [
      (with inputs; [
        snowpkgs.overlays.default
        trashy.overlays.default
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
  nix.gc = {
    automatic = true;
    frequency = "daily";
    persistent = true;
  };
}
