##Configuration for ZSH shell##

{config, pkgs, ...}: {
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
        #Theme
        theme = "muse";
        };
      plugins = [
      {
        #Autosuggestions plugin
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
        sha256 = "B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
      };
      }
     {
        #Syntax highlighting plugin
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "143b25eb98aa3227af63bd7f04413e1b3e7888ec";
            sha256 = "TKGCck51qQ50dQGntKaeSk8waK3BlwUjueg4MImTH8k=";
          };
        }
      {
        #Autocomplete plugin
        name = "zsh-autocomplete";
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "23.07.13";
          sha256 = "0NW0TI//qFpUA2Hdx6NaYdQIIUpRSd0Y4NhwBbdssCs=";
        };
      }
    ];
  };

  #Directory marks for jump plugin
  home.file.".marks".source = config.lib.file.mkOutOfStoreSymlink ./marks;
}
