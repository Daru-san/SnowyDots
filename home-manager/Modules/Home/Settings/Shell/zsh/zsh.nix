##Configuration for ZSH shell##

{config, pkgs, ...}: {
    programs.zsh = {
      enable = true;
      #Aliases for zsh
      shellAliases =let
         git = "${config.programs.git.package}/bin/git";
         neofetch = "${pkgs.neofetch}/bin/neofetch";
         tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
         kitty = "${config.programs.kitty.package}/bin/kitty";
        ani-cli = "${pkgs.ani-cli}/bin/ani-cli";
  in {
    g = "${git}";
    ll = "ls -l";
    ex = "exit";
    cat = "ccat";    
    logout = "loginctl terminate-user $USER";
    nofetch = "${neofetch} --config none"; 
    O_O = "echo Hi!";
    clock = "${tty-clock} -b -s -c -B -r -n -S";
    nv = "${neovim}";
    rsync-copy = "rsync -avzhe --progress";
    rsync-move = "rsync --remove-source-files -zvh --progress";
    nix-rebuild = "sudo nixos-rebuild switch";
    nix-edit = "sudoedit /etc/nixos/configuration.nix";
    nix-editHW = "sudoedit /etc/nixos/hardware-configuration.nix";
    rs = "reset";
    cl = "clear";
        anifetch = "${neofetch} --config ~/.config/neofetch/anifetch.conf";
        img = "kitten icat --hold";
        cdots = "cd ~/Nix-Dots/";
        cdownl = "cd ~/Downloads/";
        cdocs = "cd ~/Documents/";
        cwalls = "cd ~/Wallpapers/";
        ani = "${ani-cli} --rofi --vlc";
        anidu = "${ani-cli}  --rofi --vlc --dub";
        anid = "${ani-cli} -d";
        anidud = "${ani-cli} --dub -d";
        j = "jump";
        img = "kitten icat --hold";
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
  home.file.".marks".source = config.lib.file.mkOutOfStoreSymlink ./marks; #Add marks to home directory (used for autojump)
}
