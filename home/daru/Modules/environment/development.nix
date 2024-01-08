{outputs, ...}:{
  imports = with outputs.homeManagerModules; [
    neovim-nightly
    java
    python
    gitui
  ] ++ [
    ./git.nix
  ];
}
