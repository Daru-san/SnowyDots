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
  programs.neovide = {
    enable = true;
    settings = {
      neovim-bin = lib.getExe config.programs.nixvim.build.package;
      title-hidden = false;
    };
  };
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
    imports = [
      inputs.vim.nixvimModules.default
      stylix.targets.nixvim.exportedModule
    ];
    extraConfigLua = ''
      if vim.g.neovide then
        vim.g.neovide_cursor_animation_length = 0
      end
    '';
    plugins.jdtls.enable = lib.mkForce false;
    plugins.lsp.servers = {
      kotlin_language_server.enable = lib.mkForce false;
      zls.package = lib.mkForce pkgs.zls_0_16;
    };
    lsp.servers.pasls = {
      enable = false;
    };
    extraPackages = [
      pkgs.pasfmt
    ];
  };
}
