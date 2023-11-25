{pkgs, ...}:{
  #Custom system activation script that runs whenever I use 'nix-rebuild'
  system.userActivationScripts = {
    home-setup-daru.text = '' 
      #If the '~/.config/nvim' folder doesn't exist it'll clone, otherwise it won't
      #It won't clone if the folder already exists, this would be useful incase there is another configuration that I don't want overwritten
      #Just delete the folder to get my custom configs from my repo

      if [ ! -d /home/daru/.config/nvim ];
      then
        ${pkgs.git}/bin/git clone https://github.com/Daru-san/NeoLaze /home/daru/.config/nvim/
      fi


      #Clone my dotfiles repo to '~/Projects/repo' everytime the system is build
      #or pull changes from github 
      #
      #This is to make using a custom script for nix-rebuild easier

      if [ ! -d /home/daru/Projects/repo ];
      then
        ${pkgs.git}/bin/git clone https://github.com/Daru-san/Snowflake-dots /home/daru/Projects/repo
      else
        cd /home/daru/Projects/repo
        ${pkgs.git}/bin/git pull
      fi
    '';
  }; 
}
