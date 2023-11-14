{pkgs, ...}:{
  programs.tmux = {
    enable = true;
    package = pkgs.unstable.tmux;
    clock24 = true;
    mouse = true;
  };
}
