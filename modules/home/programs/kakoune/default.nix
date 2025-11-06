{
  pkgs,
  lib,
  system,
  inputs,
  ...
}:
let
  package = pkgs.kakoune-unwrapped;
  luar = pkgs.kakouneUtils.buildKakounePlugin {
    pname = "laur";
    version = lib.getVersion package;
    src = pkgs.fetchFromGitHub {
      owner = "gustavo-hms";
      repo = "luar";
      rev = "e32ac89fdc43e5dbd8750d55cbcf1aea66d3ebdf";
      hash = "sha256-Hz4e3c/cv7K7+pXIOI3eqYmJgWHuRSdI50hqurGey/g=";
    };
  };

  peneira = pkgs.kakouneUtils.buildKakounePlugin {
    pname = "peneira";
    version = lib.getVersion package;
    src = pkgs.fetchFromGitHub {
      owner = "gustavo-hms";
      repo = "peneira";
      rev = "affb262f00aa1f48437559c089faf192f4017129";
      hash = "sha256-Ud6ybE96o3pgchAw0PDzWCxUT63qvJYRaxwUyP6uJ1A=";
    };
  };
  wrapped-kakoune = pkgs.wrapKakoune package {
    configure = {
      plugins = with pkgs.kakounePlugins; [
        zig-kak
        kakoune-lsp
        kak-auto-pairs
        kak-buffers
        powerline-kak
        kakboard
        kak-byline
        kak-fzf
        smarttab-kak
        peneira
        luar
      ];
    };
  };
  extra-packages = import ../helix/packages.nix { inherit pkgs; };

  final-package = pkgs.symlinkJoin {
    pname = "kakoune";
    version = lib.getVersion package;
    paths = [ wrapped-kakoune ];
    preferLocalBuild = true;
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/kak \
        --suffix PATH : ${lib.makeBinPath extra-packages}
    '';
  };
in
{
  imports = [
    inputs.kak-tree-sitter-helix.homeManagerModules.${system}.kak-tree-sitter-helix
  ];
  programs = {
    kak-tree-sitter-helix.enable = true;
    kakoune = {
      enable = true;
      package = final-package;
      config = {
        alignWithTabs = true;
        autoReload = "ask";
        tabStop = 4;
        numberLines = {
          enable = true;
          relative = false;
          highlightCursor = true;
        };
        showMatching = true;

        ui = {
          assistant = "none";
          enableMouse = true;
          setTitle = true;
          statusLine = "bottom";
        };
      };
      extraConfig = ''
        require-module luar
        require-module peneira
        set-option global luar_interpreter luajit
        set-option global ui_options terminal_padding_char=
        eval %sh{kak-lsp}
        lsp-enable

        require-module powerline

        powerline-format global "git lsp bufname filetype mode_info lsp line_column position"
        set-option global powerline_separator_thin ""
        set-option global powerline_separator ""

        powerline-start

        set-option global auto_pairs ( ) { } [ ] '"' '"' "'" "'" ` ` “ ” ‘ ’ « » ‹ › | |

        enable-auto-pairs

        lsp-inlay-diagnostics-enable global

        map global insert <c-n> '<a-;>:lsp-snippets-select-next-placeholders<ret>' -docstring 'Select next snippet placeholder'
        hook global InsertCompletionShow .* %{
            unmap global insert <c-n> '<a-;>:lsp-snippets-select-next-placeholders<ret>'
        }
        hook global InsertCompletionHide .* %{
          map global insert <c-n> '<a-;>:lsp-snippets-select-next-placeholders<ret>' -docstring 'Select next snippet placeholder'
        }

        hook -group lsp-filetype-nix global BufSetOption filetype=nix %{
            set-option buffer lsp_servers %{
              [nil]
              root_globs = ["flake.nix", "shell.nix", ".git", ".hg"]
              [nixd]
              root_globs = ["flake.nix", "shell.nix", ".git", ".hg"]
            }
        }

        hook global BufSetOption filetype=nix %{
          hoot buffer BufWritePre .* lsp-formatting-sync nil
          set-option buffer indentWidth 2
        }

        map global user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'

        map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'

        map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
        map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
        map global object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
        map global object t '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
        map global object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
        map global object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

        map global normal <c-a> '<a-semicolon>lsp-hover<ret>' --docstring 'LSP hover information'

        map global normal <tab> ': buffer-next<ret>'
        map global normal <s-tab> ': buffer-previous<ret>'

        map global normal <C-a> ': comment-line<ret>'

        require-module byline

        hook global WinCreate .* %{ kakboard-enable }

        hook global InsertCompletionShow .* %{
            try %{
              execute-keys -draft 'h<a-K>\h<ret>'
              map window insert <tab> <c-n>
              map window insert <s-tab> <c-p>
              hook -once -always window InsertCompletionHide .* %{
                unmap window insert <tab> <c-n>
                unmap window insert <s-tab> <c-p>
              }
            }
        }

        hook global WinSetOption filetype=(typescript|javascript|css|html|json|rust|ruby|eruby|lua|markdown|toml|c|cpp|csharp|zig|go|java|kotlin|scss) %{
            hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
            hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
            hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
            hook window BufWritePre .* lsp-formatting-sync
            hook -once -always window WinSetOption filetype=.* %{
              remove-hooks window semantic-tokens
            }
        }

        set-option global peneira_files_command "rg --files"

        map global normal <c-y> ':perenia-files<ret>'
        map global normal <c-z> ':perenia-local-files<ret>'

        evaluate-commands %sh{ kak-tree-sitter --init $kak_session --kakoune --daemonize --server --with-highlighting }

        colorscheme base16-terminal
      '';
    };
  };
}
