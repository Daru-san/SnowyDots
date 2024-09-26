{ pkgs, ... }:
{
  # Enable neovim and set as main editor
  programs.nano.enable = false;
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Enable aliases for vi and vim
    viAlias = true;
    vimAlias = true;
    configure = {
      # Default neovim plugins
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
