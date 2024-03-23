{
  lib,
  inputs,
  outputs,
  ...
}:
with lib; {
  imports =
    [./firefox.nix ./spotify.nix ./packages.nix]
    ++ (with inputs; [
      spicetify-nix.homeManagerModules.default
      nur.nixosModules.nur
      nix-colors.homeManagerModules.default
    ]);

  nixpkgs = {
    overlays = [
      # Overlay for stable packages (23.05)
      outputs.overlays.stable-packages

      # Import custom packages
      outputs.overlays.additions
    ];
    config = {
      # Allowing unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;

      # Fix electron packages
      permittedInsecurePackages = ["electron-25.9.0"];
    };
  };
  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 7d";
  };
}
