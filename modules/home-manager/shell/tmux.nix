{
  pkgs,
  lib,
  ...
}: {
  # Tmux
  programs.tmux = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    shell = "${config.programs.zsh.package}/bin/zsh";
    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      cpu
      extrakto
      fuzzback
      onedark-theme
      sidebar
      tilish
      yank
      urlview
      jump
      copy-toolkit
    ];
  };
}
