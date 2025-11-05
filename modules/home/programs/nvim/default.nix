{
  inputs,
  config,
  ...
}:
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
      config.lib.stylix.nixvim.config
      inputs.vim.nixvimModules.default
    ];
  };
}
