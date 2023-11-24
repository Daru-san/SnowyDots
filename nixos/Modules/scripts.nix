{pkgs, ...}:{
  #Script to clone my person neovim config repo
  system.userActivationScripts = {
    home-setup-daru.text = ''
      #If the '~/.config/nvim' folder doesn't exist it'll clone, otherwise it won't
      #It won't clone if the folder already exists, this would be useful incase there is another configuration that I don't want overwritten
      #Just delete the folder to get my custom configs from my repo

      if [ ! -d $HOME/.config/nvim ];
      then
        ${pkgs.git}/bin/git clone https://github.com/Daru-san/NeoLaze $HOME/.config/nvim/
      fi
    '';
  }; 
}
