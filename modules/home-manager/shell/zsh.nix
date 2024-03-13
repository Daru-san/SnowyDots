# #Configuration for ZSH shell##
{
  config,
  pkgs,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
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

      # Configuring antidote, a very fast zsh plugin manager
      antidote = {
        enable = true;
        useFriendlyNames = true;

        # Custom plugins
        plugins =
          [
            "joknarf/redo"
            "jimhester/per-directory-history"
            "mrjohannchang/zsh-interactive-cd"
            "chisui/zsh-nix-shell"
            "hlissner/zsh-autopair"
            "fdellwing/zsh-bat"
            "mollifier/cd-gitroot"
            "zpm-zsh/clipboard"
            "tom-auger/cmdtime"
            "Aloxaf/fzf-tab"
          ]
          # Plugins from oh-my-zsh
          ++ (let
            o = regex: "ohmyzsh/ohmyzsh path:plugins/${regex}";
          in [
            (o "sudo")
            (o "extract")
            (o "cp")
          ]);
      };

      # Prezto for custom configurations, themes are set by oh-my-posh, plugins by antidote
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
  };
}
