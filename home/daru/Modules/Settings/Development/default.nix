{pkgs, outputs, ...}:{
  imports = [
    ./git.nix
    outputs.homeManagerModules.neovim-nightly;
  ];
}
