{
  system,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${system}.default;
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      powerBar
      adblock
    ];
    enabledCustomApps = with spicePkgs.apps; [
      library
      history-in-sidebar
    ];
  };
}
