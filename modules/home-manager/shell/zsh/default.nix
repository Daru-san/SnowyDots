# #Configuration for ZSH shell##

{ config, pkgs, ... }: {

  # Enable command-not-found
  programs.command-not-found = { enable = true; };

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
      };

      # Syntax highlighting
      syntaxHighlighting = { enable = true; };

      # Enable autosuggestions
      enableAutosuggestions = true;

      plugins = [{
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }];
      # Oh-my-zsh for plugins, themes are set by oh-my-posh
      oh-my-zsh = {
        enable = true;

        # Plugins
        plugins = [
          "git"
          "sudo"
          "colorize"
          "per-directory-history"
          "catimg"
          "extract"
          "colored-man-pages"
          "copypath"
          "copyfile"
          "zsh-interactive-cd"
          "copybuffer"
          "fzf"
          "adb"
          "rsync"
        ];
      };
    };
  };
}
