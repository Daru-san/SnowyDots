{ pkgs, inputs, ... }:
with pkgs;
let
  pascal-lsp = inputs.pascal-lsp.packages.${system};
in
[
  marksman
  nil
  nixd
  nixfmt
  rustfmt
  rust-analyzer
  sqls
  asm-lsp
  cmake-language-server
  taplo
  zls
  yaml-language-server
  jq-lsp
  gopls
  lua-language-server
  luajitPackages.teal-language-server
  luajit
  clang-tools
  efm-langserver
  mesonlsp
  vscode-langservers-extracted
  vale-ls
  rustc
  markdownlint-cli
  typescript-language-server
  kotlin-language-server
  jdt-language-server
  just
  just-formatter
  just-lsp
  typos
  blueprint-compiler
  cargo
  crates-lsp
  jq
  stylua
  (pkgs.symlinkJoin {
    pname = "${pascal-lsp.pasls.pname}-env";
    version = lib.getVersion pascal-lsp.pasls;
    paths = [ pascal-lsp.pasls ];
    preferLocalBuild = true;
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/pasls \
        --set PP ${pkgs.fpc}/bin/fpc \
        --set LAZARUSDIR ${pkgs.lazarus-qt6}/share/lazarus \
        --set FPCDIR ${pkgs.lazarus-qt6}/share/fpcsrc \
        --prefix PATH ${
          lib.strings.makeBinPath (
            with pkgs;
            [
              fpc
              lazarus-qt6
            ]
          )
        }
    '';
  })
]
