{
  programs = {
    # Coloured ls with cool features
    eza = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = ["--group-directories-first"];
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    # cd on steriods
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };

    # Searching through directories with ease
    broot = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      settings.modal = true;
    };

    thefuck = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    # Find files fuzzily
    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    # Query nix databases when a command isn't found
    nix-index = {
      enable = false;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
