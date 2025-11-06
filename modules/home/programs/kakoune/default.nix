{
  pkgs,
  lib,
  system,
  inputs,
  ...
}:
let
  package = pkgs.kakoune-unwrapped;
  popup-kak = inputs.popup-kak.packages.${system}.default;
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
      ];
    };
  };

  extra-packages = import ../helix/packages.nix { inherit pkgs; } ++ [
    popup-kak
    pkgs.tmux
  ];

  final-package = pkgs.symlinkJoin {
    pname = "kakoune";
    version = lib.getVersion package;
    paths = [ wrapped-kakoune ];
    preferLocalBuild = true;
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/kak \
        --suffix PATH : ${lib.makeBinPath extra-packages} \
        --set KAKOUNE_POSIX_SHELL ${lib.getExe pkgs.dash}
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
      defaultEditor = true;
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
        keyMappings =
          let
            yazi-picker = pkgs.writeTextFile {
              name = "yazi-picker";
              executable = true;
              text = ''
              	#! ${lib.getExe pkgs.dash}

    			id=(shuf -i 1-4096 -n 1)
              	output=/tmp/kakoune-yazi-$id
              	rm -f $output

              	yazi --chooser-file $output > /dev/null

              	cat $output
              '';

              destination = "/bin/yazi-picker";
            };
          	yazi-picker-cwd = pkgs.writeTextFile {
              name = "yazi-picker";
              executable = true;
              text = ''
              	#! ${lib.getExe pkgs.dash}

    			id=(shuf -i 1-4096 -n 1)
              	output=/tmp/kakoune-yazi-$id
              	rm -f $output

              	cd $(dirname "$0")

              	yazi --chooser-file $output > /dev/null

              	cat $output
              '';

              destination = "/bin/yazi-picker";
          	};
            zoxide-fzf = pkgs.writeTextFile {
              name = "zoxide-fzf";
              executable = true;
              text = ''
                	#! ${lib.getExe pkgs.dash}
                	zoxide query --list | fzf
              '';
              destination = "/bin/zoxide-fzf";
            };
            fzf = pkgs.writeShellScript "fzf" ''
            	fzf --preview 'bat --color=always {}'
            '';
            mkBind = mode: key: effect: docstring: {
              inherit
                mode
                key
                effect
                docstring
                ;
            };
          in
          [
            (mkBind "user" "g" ":popup lazygit<ret>" "Launch lazygit")
            (mkBind "user" "f" ":popup --title open --kak-script %{edit %opt{popup_output}} -- ${fzf}<ret>"
              "Find a file using FZF"
            )
            (mkBind "normal" "<c-y>"
              ":popup --title yazi --kak-script %{edit %opt{popup_output}} -- ${yazi-picker}/bin/yazi-picker<ret>"
              "Find a file using Yazi"
            )
            (
                mkBind "normal" "<c-Y>"
              ":popup --title yazi --input %{val buffile} --kak-script %{edit %opt{popup_output}} -- ${yazi-picker}/bin/yazi-picker<ret>"
              "Find a file from the current directory using Yazi"
            )
            (mkBind "user" "z"
              ":popup --title zoxide --kak-script %{cd %opt{popup_output}} -- ${zoxide-fzf}/bin/zoxide-fzf<ret>"
              "Change the active directory using Zoxide"
            )
            (mkBind "user" "Z" ":popup --title fzf --kak-script %{cd $out{popup_output}} -- fzf<ret>"
              "Change the active directory using fzf"
            )
            (
                mkBind "normal" "<c-n>" ":lsp-formatting-sync nil<ret>" "Format the current Nix file"
            )
            (mkBind "normal" "<c-a>" ":lsp-hover<ret>" "Show LSP hover information")
            (mkBind "normal" "<tab>" ":buffer-next<ret>" "Go to the next buffer")
            (mkBind "normal" "<s-tab>" ":buffer-previous<ret>" "Go to the previous buffer")
            (mkBind "normal" "<c-x>" ":comment-line<ret>" "Toggle comment on the current line")
            (mkBind "normal" "<c-r>" ":lsp-rename-prompt<ret>" "Rename the hovered variable")
            (mkBind "normal" "<c-t>" ":popup nu<ret>" "Launch a terminal prompt")
            (mkBind "user" "b" ":pick-buffers<ret>" "Pick a buffer")
          ];
      };
      extraConfig = ''
        set-option global ui_options terminal_padding_char=
        eval %sh{kak-lsp}
        evaluate-commands %sh{kak-popup init}
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
          hook buffer BufWritePre .* lsp-formatting-sync nil
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

        evaluate-commands %sh{ kak-tree-sitter --init $kak_session --kakoune --daemonize --server --with-highlighting }

        colorscheme base16-terminal
      '';
    };
  };
}
