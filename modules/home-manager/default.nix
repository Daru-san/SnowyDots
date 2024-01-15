#Shared home modules
{
  git = import ./git/default.nix;
  tmux = import ./tmux/default.nix;
  mpv = import ./mpv/default.nix;
  btop = import ./btop/default.nix;
  xdg = import ./xdg/default.nix;
  audio = import ./audio/default.nix;
  neovim = import ./neovim/default.nix;
  shell = import ./shell/default.nix;
  ranger = import ./ranger/default.nix;
  wayland = import ./wayland/default.nix;
  connect = import ./connect/default.nix;
}
