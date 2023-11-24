{config, pkgs, lib, ...}:{
  programs = {
    neovim = {
      #Enable neovim, set to nightly and make it the default editor
      package = pkgs.neovim-nightly;
      enable = true;
      defaultEditor = true;

      #Vi and vim aliases
      viAlias = true;
      vimAlias = true;
    };
  };
}
