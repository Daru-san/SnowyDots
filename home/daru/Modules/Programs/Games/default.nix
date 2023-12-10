{outputs, ...}:{
  imports = [
    ./lutris.nix
  ];
  imports = with outputs.homeManagerModules; [
    prism-launcher
    mangohud
  ];
}
