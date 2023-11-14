##Global shell configuration##
{config, pkgs, ...}:{
  imports = [
  #Import tmux and zsh configs
  ./zsh/zsh.nix
  ./tmux/default.nix
  ];
}
