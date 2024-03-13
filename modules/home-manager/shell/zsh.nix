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
      expireDuplicatesFirst = true;
    };

    # Syntax highlighting
    syntaxHighlighting = {enable = true;};

    # Enable autosuggestions
    enableAutosuggestions = true;

    # Plugins managed by antidote
    antidote = {
      enable = true;
      useFriendlyNames = true;

      # Custom plugins
      plugins =
        [
          "joknarf/redo"
          "jimhester/per-directory-history"
          "chisui/zsh-nix-shell"
          "hlissner/zsh-autopair"
          "fdellwing/zsh-bat"
          "mollifier/cd-gitroot"
          "zpm-zsh/clipboard"
          "tom-auger/cmdtime"
          "Atlas34/fzf-plugin"
          "jeffreytse/zsh-vi-mode"
        ]
        # Plugins from oh-my-zsh
        ++ (let
          o = regex: "ohmyzsh/ohmyzsh path:plugins/${regex}";
        in [(o "sudo") (o "extract") (o "cp")]);
    };

    # Configuration and custom modules from Prezto
    prezto = {
      enable = true;
      syntaxHighlighting.highlighters = [
        "main"
        "brackets"
        "pattern"
        "line"
        "root"
      ];
      caseSensitive = true;
      pmodules = [
        "rsync"
        "archive"
        "command-not-found"
        "completion"
        "directory"
        "syntax-highlighting"
        "git"
        "utility"
      ];
    };
  };
}
