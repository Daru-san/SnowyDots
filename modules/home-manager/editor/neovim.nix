{ pkgs, ... }: {
  programs.neovim = {
    package = pkgs.neovim-nightly;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
