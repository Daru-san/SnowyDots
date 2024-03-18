{
  pkgs,
  inputs,
  ...
}: {
  programs.neovim = {
    package = inputs.snowyvim.packages.${pkgs.system}.nvim;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
