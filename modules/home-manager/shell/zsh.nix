# #Configuration for ZSH shell##
{
  config,
  pkgs,
  ...
}: {
  programs = {
    # Zsh configs
    zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      zsh-abbr.enable = true;
      command-not-found.enable = true;

      # Put zsh configs in .config/zsh
      dotDir = config.xdg.configHome ++ "/zsh";

      # History file
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
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
            "magidc/fzf-copyq-clipboard-zsh-plugin"
          ]
          # Plugins from oh-my-zsh
          ++ (let
            o = regex: "ohmyzsh/ohmyzsh path:plugins/${regex}";
          in [
            (o "sudo")
            (o "vi-mode")
            (o "fd")
            (o "fancy-ctrl-z")
            (o "extract")
            (o "cp")
            (o "fzf")
          ]);
      };

      # Prezto for custom configurations, themes are set by oh-my-posh, plugins by antidote
      prezto = {
        enable = true;
        editor = {
          promptContext = true;
          dotExpansion = true;
          keymap = "vi";
        };
        terminal = {
          autoTitle = true;
          tabTitleFormat = "%m: %s";
        };
        prompt.theme = "off";
        caseSensitive = true;
        pmodules = [
          "environment"
          "rsync"
          "archive"
          "command-not-found"
          "directory"
          "git"
          "utility"
        ];
      };
    };
  };
}
