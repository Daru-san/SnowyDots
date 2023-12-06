##Configuration for ZSH shell##

{config, pkgs, ...}: {

  #Enable command-not-found
  programs.command-not-found = {
    enable = true;
  };

  programs = { #Zsh configs
    zsh = {
      enable = true;

      #History file
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      #Syntax highlighting
      syntaxHighlighting = {
        enable = true;
      };

      #Enable autosuggestions
      enableAutosuggestions = true;
      
      #Oh-my-zsh for plugins, themes are set by oh-my-posh
      oh-my-zsh = {
        enable = true;
        #Plugins
        plugins = [ 
          "git" 
          "sudo" 
          "colorize"
          "per-directory-history"
          "catimg" 
          "extract"
          "web-search"
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