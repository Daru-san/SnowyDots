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

    # cd on steroids
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
      historyWidget.options = [
        "--sort"
        "--exact"
      ];
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    atuin = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      daemon.enable = true;
      flags = [
        "--disable-ctrl-r"
      ];
      settings = {
        workspaces = true;
        store_failed = false;
        secrets_filter = true;
        keymap_mode = "vim-normal";
        style = "compact";
        show_help = false;
        history_filter = [
          "^$env"
        ];
        cwd_filter = [
          "^secret"
          "^project"
          "^Documents"
          "^Download"
        ];
      };
    };
  };
}
