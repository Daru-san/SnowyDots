{
  inputs,
  system,
  ...
}:
let
  pascal-tools = inputs.pascal-tools.packages.${system};
in
{
  imports = [
    inputs.vim.homeModules.default
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
    imports = [
      inputs.vim.nixvimModules.default
    ];
    lsp.servers.pasls = {
      enable = false;
      package = pascal-tools.pasls;
    };
    extraPackages = [
        pascal-tools.pasfmt
    ];
  };
}
