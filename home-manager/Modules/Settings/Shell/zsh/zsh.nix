##Configuration for ZSH shell##

{config, pkgs, ...}: {
    
    #Enable command-not-found
    programs.command-not-found = {
      enable = true;
    };

    #Zsh configs
    programs.zsh = {
      enable = true;
      #Aliases for zsh
      shellAliases = let
        git = "${config.programs.git.package}/bin/git";
        neofetch = "${pkgs.neofetch}/bin/neofetch";
        tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
        kitty = "${config.programs.kitty.package}/bin/kitty";
        ani-cli = "${pkgs.ani-cli}/bin/ani-cli";
      in {
        g = "${git}";
        nofetch = "${neofetch} --config none"; 
        clock = "${tty-clock} -bscBrnS";
        anifetch = "${neofetch} --config ~/.config/neofetch/anifetch.conf";
        j = "jump";
       };

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
      
      #Oh-my-zsh for themes and plugins
      oh-my-zsh = {
        enable = true;
        #Plugins
        plugins = [ 
          "git" 
          "sudo" 
          "colorize" 
          "catimg" 
          "jump" 
          "extract"
          "web-search"
          "colored-man-pages"
          "copypath"
          "copyfile"
          ];
        };
      plugins = [
      
    ];
  };

  #Directory marks for jump plugin
  home.file.".marks".source = config.lib.file.mkOutOfStoreSymlink ./marks;
}
