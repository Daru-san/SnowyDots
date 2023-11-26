{pkgs, ...}:{
  #Custom system activation script that runs whenever I use 'nix-rebuild'
  system.userActivationScripts = {

    auto-clone.text = '' 
      #If the '~/.config/nvim' folder doesn't exist it'll clone, otherwise it won't
      #It won't clone if the folder already exists, this would be useful incase there is another configuration that I don't want overwritten
      #Just delete the folder to get my custom configs from my repo

      if [ ! -d /home/daru/.config/nvim ];
      then
        ${pkgs.git}/bin/git clone https://github.com/Daru-san/NeoLaze /home/daru/.config/nvim/
      fi

      #Same thing but for my 'Nix-Scripts' repo
      if [ ! -f /home/daru/Scripts/README.md ];
      then
        ${pkgs.git}/bin/git clone https://github.com/Daru-san/Nix-Scripts /home/daru/Scripts/
      fi
    '';
  }; 
}
