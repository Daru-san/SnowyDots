{outputs, ...}:{
  imports = with outputs.homeManagerModules; [
    prism-launcher
    mangohud
  ] ++ [
    ./lutris.nix
  ];
}
