{pkgs, ...}:{
  environment = {
    #Installed shells
    shells = with pkgs; [
      zsh
      bashInteractive
    ];

    #GLobal shell aliases
    shellAliases = let     
    ranger = "${pkgs.ranger}/bin/ranger";
    w3m = "${pkgs.w3m}/bin/w3m";
  in {
    ll = "ls -l";
    ex = "exit";   
    logout = "loginctl terminate-user $USER";
    rsync-copy = "rsync -avzhe --progress";
    rsync-move = "rsync --remove-source-files -zvh --progress";
    nix-rebuild = "sudo nixos-rebuilt";
    rs = "reset";
    cl = "clear";
    r = "${ranger}";
    nix-upgrade = "sudo nixos-rebuild switch --upgrade-all";
    rebootF = "sudo systemctl reboot -f";
    nix-manual = "${w3m}/bin/w3m file:///nix/store/cvnacwjawy7fi41q5ffklvxcjnhnib3k-nixos-manual-html/share/doc/nixos/index.html";
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
