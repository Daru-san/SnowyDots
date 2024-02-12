{pkgs, ...}:{
  programs.neovim = {
    package = pkgs.neovim-nightly;
    enable = true;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
