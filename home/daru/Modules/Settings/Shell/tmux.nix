{pkgs, ...}:{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    history-limit = 2000;
    plugins = with pkgs.tmuxPlugins; [
      cpu
      battery
      tmux-fzf
      fuzzback
      net-speed
      mode-indicator
      onedark-theme
      better-mouse-mode
      sysstat
      yank
      jump
    ];
  };
}
