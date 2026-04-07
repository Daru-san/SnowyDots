{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
in
{
  imports = [
    inputs.vim.homeModules.default
  ];
  programs.nixvim = {
    enable = false;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
    imports = [
      inputs.vim.nixvimModules.default
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
