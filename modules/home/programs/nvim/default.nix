{
  inputs,
  system,
  pkgs,
  lib,
  ...
}:
let
  pascal-tools = inputs.pascal-tools.packages.${system};
  pascal-lsp = inputs.pascal-lsp.packages.${system};
  pascal-gtk4-bindings = inputs.pascal-gtk-bindings;
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
      package = pkgs.symlinkJoin {
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
      };
      config = {
        cmd = [ "pasls" ];
        filetypes = [
          "pascal"
          "fpc"
          ".lpi"
          ".lpr"
        ];
        settings = {
          fpcOptions = [
            "-Fu${pascal-gtk4-bindings}/bindings"
            "-FU${pascal-gtk4-bindings}/bindings"
          ];
          insertCompletionsAsSnippets = true;
          insertCompletionProcedureBrackets = false;
          includeWorkspaceFoldersAsUnitPaths = true;
          includeWorkspaceFoldersAsIncludePaths = true;
          checkSyntax = true;
          publishDiagnostics = true;
          workspaceSymbols = true;
          documentSymbols = true;
          showSyntaxErrors = true;
        };
      };
    };
    extraPackages = [
      pascal-tools.pasfmt
    ];
  };
}
