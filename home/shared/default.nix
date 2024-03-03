{
  lib,
  inputs,
  ...
}: {
  imports = mkMerge [
    [./firefox.nix ./spotify.nix ./packages.nix]
    (with inputs; [spicetify-nix.homeManagerModule.default nur.nixosModule.nur])
  ];
}
