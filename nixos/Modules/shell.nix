{pkgs, ...}:{
  #Enable zsh
  programs.zsh = {
    enable = true;

    #Colors in ls
    enableLsColors = true;

    #Syntax highlighting
    syntaxHighlighting = {
      enable = true;
    };

    #Autosuggestions
    autosuggestions = {
      enable = true;
    };
  };
  environment = {
    #Installed shells
    pathsToLink = [ "/share/zsh" ];
    #GLobal shell aliases
    shellAliases = let     
      ranger = "${pkgs.ranger}/bin/ranger";
      w3m = "${pkgs.w3m}/bin/w3m";
      rsync = "${pkgs.rsync}/bin/rsync";
    in {
     #Useful shell aliases
      ll = "ls -l";
      ex = "exit";   
      rs = "reset";
      cl = "clear";
      rebootF = "sudo systemctl reboot -f";
      logout = "loginctl terminate-user $USER";

      #Userful rsync aliases
      rsync-copy = "${rsync} -avzhe --progress";
      rsync-move = "${rsync} --remove-source-files -zvh --progress";

      #Nix aliases
      nix-upgrade = "j snow && sudo nixos-rebuild switch --flake .#AspireNix --upgrade-all --impure";
      nix-rebuild = "j snow && sudo nixos-rebuild switch --flake .#AspireNix --impure"; 
    
      #Program specific aliases
      r = "${ranger}";
    };
  };

  #Enable neovim and set as main editor
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    #Enable aliases for vi and vim
    viAlias = true;
    vimAlias = true;
    configure = {

      #Default neovim plugins
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ 
          vim-nix
          vim-clap
          barbecue-nvim
        ];
      };
    };
  };
}
