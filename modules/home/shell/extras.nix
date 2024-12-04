{
  programs = {
    # Coloured ls with cool features
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      extraOptions = [ "--group-directories-first" ];
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    # cd on steriods
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
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

    # Direnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
      config = {
        whitelist.prefix = [
          "~/Development/Repos"
        ];
        global.disable_stdin = true;
      };
    };

    nix-your-shell = {
      enable = true;
      enableNushellIntegration = true;
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
