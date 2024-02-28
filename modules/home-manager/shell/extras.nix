{...}: {
  # Unified theming for bash and zsh
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # Coloured ls with cool features
  programs.eza = {
    enable = true;
    git = true;
    icons = true;
    extraOptions = ["--group-directories-first" "--header"];
    enableAliases = true;
  };

  # Query nix store paths easily
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  # Manage shell history
  programs.hstr = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  # cd on steriods
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };


  # Tmux for lazy people, like me
  programs.zellij = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;
  };

  # Searching through directories with ease
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
