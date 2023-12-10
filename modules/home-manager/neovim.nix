{config, pkgs, lib, ...}:{
  programs = {
    neovim = {
      #Enable neovim
      enable = true;
      defaultEditor = true;

      #Vi and vim aliases
      viAlias = true;
      vimAlias = true;

      #Vimdiff alias for showing file diffs
      vimdiffAlias = true;
    };
  };
}
