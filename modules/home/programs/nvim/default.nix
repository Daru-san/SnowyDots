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
      enable = true;
      package = pascal-tools.pasls-prebuilt;
    };
    extraPackages = [
        pascal-tools.pasfmt
    ];
  };
}
