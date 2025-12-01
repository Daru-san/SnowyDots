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
  fpc-wayland = pkgs.fetchFromGitHub {
    owner = "Daru-san";
    repo = "fpc-wayland";
    rev = "a7dda3f71ea773ee33d27b770d66174247c65d5a";
    hash = "sha256-MDkmPCDZB/5JRDwtSD+fnzls2zb34Tz73HvvvQ0fZis=";
  };
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
            "-Fu${fpc-wayland}/waylandpkg"
            "-FU${fpc-wayland}/waylandpkg"
            "-Fu${fpc-wayland}/supportpkg"
            "-FU${fpc-wayland}/supportpkg"
            "-Fu${fpc-wayland}/waylandstablepkg"
            "-FU${fpc-wayland}/waylandstablepkg"
            "-Fu${fpc-wayland}/waylandunstablepkg"
            "-FU${fpc-wayland}/waylandunstablepkg"
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
