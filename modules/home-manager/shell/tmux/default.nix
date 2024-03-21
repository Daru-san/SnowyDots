{
  pkgs,
  config,
  ...
}: {
  # Tmux
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    shell = "${config.programs.zsh.package}/bin/zsh";
    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      cpu
      battery
      extrakto
      fuzzback
      onedark-theme
      sidebar
      yank
      urlview
      jump
      copy-toolkit
    ];
  };
}
