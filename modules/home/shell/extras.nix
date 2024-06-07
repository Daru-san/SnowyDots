{
  programs = {
    # Coloured ls with cool features
    eza = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = ["--group-directories-first"];
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    # cd on steriods
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };

    # Searching through directories with ease
    broot = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      settings.modal = true;
    };

    thefuck = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };

    # Find files fuzzily
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      defaultOptions = [
        "--border"
        "--highlight-line"
        "--ansi"
      ];
      defaultCommand = "fd --type f";
      historyWidgetOptions = [
        "--sort"
        "--exact"
      ];
    };
  };
}
