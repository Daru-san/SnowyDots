{ pkgs, ... }:
with pkgs;
[
  marksman
  ltex-ls-plus
  nil
  nixd
  rust-analyzer
  sqls
  taplo
  pylyzer
  zls
  yaml-language-server
  jq-lsp
  gopls
  lua-language-server
  tailwindcss-language-server
  clang-tools
]
