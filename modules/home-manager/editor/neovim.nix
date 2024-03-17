{
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    package = inputs.snowyvim.packages.${pkgs.system}.default;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
