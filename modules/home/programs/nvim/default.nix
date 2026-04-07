{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  stylix = config.stylix;
in
{
  imports = [
    inputs.vim.homeModules.default
  ];
  stylix.targets.nixvim = {
    transparentBackground = {
      main = true;
      numberLine = true;
      signColumn = true;
    };
  };
  programs.nixvim = {
    enable = false;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
    imports = [
      inputs.vim.nixvimModules.default
      stylix.targets.nixvim.exportedModule
    ];
    plugins.jdtls.enable = lib.mkForce false;
    plugins.lsp.servers = {
      kotlin_language_server.enable = lib.mkForce false;
    };
    lsp.servers.pasls = {
      enable = false;
    };
    extraPackages = [
      pkgs.pasfmt
    ];
  };
}
