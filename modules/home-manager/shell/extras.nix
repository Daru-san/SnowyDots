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
    extraOptions = ["--group-directories-first"];
    enableAliases = true;
  };

  # cd on steriods
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  # Searching through directories with ease
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  # Find files fuzzily
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
