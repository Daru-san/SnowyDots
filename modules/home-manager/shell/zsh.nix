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

      # History file
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
        expireDuplicatesFirst = true;
        ignoreSpace = true;
      };

      # Syntax highlighting
      syntaxHighlighting = {enable = true;};

      # Enable autosuggestions
      enableAutosuggestions = true;

      # Run nix shell in zsh, instead of defaulting to bash
      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];

      zsh-abbr.enable = true;

      # Prezto for custom configurations, themes are set by oh-my-posh
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
        tmux.autoStartLocal = true;
        caseSensitive = true;
        pmodules = [
          "environment"
          "tmux"
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
