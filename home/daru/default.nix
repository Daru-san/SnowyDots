{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports =
    [./home.nix ./theme ./packages.nix]
    ++ (with inputs; [
      nix-colors.homeManagerModules.default
      chaotic.homeManagerModules.default
    ]);

  nixpkgs = {
    overlays = with outputs.overlays; [
      stable-packages
      unstable-packages
      alt-packages
      packages
      gnome46-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = ["electron-25.9.0"];
    };
  };
  nix.package = pkgs.nix;
  nix.gc = {
    automatic = true;
    interval = {
      Hour = 3;
      Minute = 40;
    };
  };
}
