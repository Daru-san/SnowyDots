{
  pkgs,
  config,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    historyLimit = 2000;
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
    keyMode = "vi";
    shell = "${config.programs.zsh.package}/bin/zsh";
    newSession = true;
  };
}
