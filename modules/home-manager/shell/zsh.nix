{config, ...}: {
  # Enable and configure zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Auto cd into directories
    autocd = true;

    # Abbreviations
    zsh-abbr.enable = true;

    # Put zsh configs in .config/zsh
    dotDir = ".config/zsh";

    # History file
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreSpace = true;
      ignoreAllDups = true;
      expireDuplicatesFirst = true;
    };

    # Enable autosuggestions
    autosuggestion.enable = true;

    # History substring searching
    historySubstringSearch.enable = true;

    # Plugins managed by antidote
    antidote = {
      enable = true;
      useFriendlyNames = true;

      # Custom plugins
      plugins =
        [
          # Plugins fetched from github
          "jimhester/per-directory-history"
          "chisui/zsh-nix-shell"
          "hlissner/zsh-autopair"
          "mollifier/cd-gitroot"
          "tom-auger/cmdtime"
          "Atlas34/fzf-plugin"
          "jeffreytse/zsh-vi-mode"
          "z-shell/F-Sy-H"
        ]
        ++ (let
          # Plugins from the oh-my-zsh repo
          o = regex: "ohmyzsh/ohmyzsh path:plugins/${regex}";
        in [(o "sudo") (o "extract") (o "cp")]);
    };

    # Configuration and custom modules from Prezto
    prezto = {
      enable = true;
      caseSensitive = true;
      pmodules = [
        "rsync"
        "archive"
        "command-not-found"
        "completion"
        "directory"
        "git"
        "utility"
      ];
      extraFunctions = [
        "zcalc"
      ];
    };
  };
}
