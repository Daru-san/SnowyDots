##Global shell configuration##
{config, pkgs, ...}:{
  imports = [
  #Import shell configs
  ./zsh/zsh.nix
  ./tmux/default.nix
  ./omp/default.nix
  ./bash/default.nix
  ];
}
