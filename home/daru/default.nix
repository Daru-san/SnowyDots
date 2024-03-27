{
  inputs,
  outputs,
  ...
}: {
  imports =
    [./home.nix ./theme ./packages.nix]
    ++ (with inputs; [
      nur.nixosModules.nur
      nix-colors.homeManagerModules.default
      chaotic.homeManagerModules.default
    ]);

  nixpkgs = {
    overlays = with outputs.overlays; [
      stable-packages
      packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = ["electron-25.9.0"];
    };
  };
  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 7d";
  };
}
