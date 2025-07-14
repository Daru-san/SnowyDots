{
  lib,
  pkgs,
  config,
  inputs,
  system,
  ...
}:
let
  atuin-completions = pkgs.stdenvNoCC.mkDerivation {
    name = "atuin-nushell-completions";
    version = pkgs.atuin.version;
    dontUnpack = true;
    nativeBuildInputs = [ config.programs.atuin.package ];
    installPhase = ''
      mkdir $out
      atuin gen-completions --shell nushell > $out/atuin.nu
    '';
  };
  crimson-completions =
    let
      crimson = inputs.crimson.packages.${system}.default;
    in
    pkgs.stdenvNoCC.mkDerivation {
      name = "crimson-nushell-completions";
      version = crimson.version;
      dontUnpack = true;
      nativeBuildInputs = [ crimson ];
      installPhase = ''
        mkdir $out
        crimson completions nushell > $out/crimson.nu
      '';
    };
  command-not-found = pkgs.writeScript "command-not-found" ''
    #!${pkgs.bash}/bin/bash
    source ${config.programs.nix-index.package}/etc/profile.d/command-not-found.sh
    command_not_found_handle "$@"
  '';

  import-scripts =
    paths: builtins.map (path: "use ${pkgs.nu_scripts}/share/nu_scripts/${path} *") paths;
  import-aliases =
    set:
    builtins.concatStringsSep "\n" (
      import-scripts (lib.mapAttrsToList (name: value: "aliases/${name}/${value}.nu") set)
    );
  import-completions =
    set:
    builtins.concatStringsSep "\n" (
      import-scripts (lib.mapAttrsToList (name: value: "custom-completions/${name}/${value}.nu") set)
    );
in
{
  programs = {
    nushell = {
      enable = true;
      settings = {
        edit_mode = "vi";
        show_banner = false;
        completions = {
          case_sensitive = false;
          quick = false;
          partial = true;
          algorithm = "prefix";
          use_ls_colors = true;
          external = {
            enable = true;
            max_results = 100;
          };
        };
        history = {
          sync_on_enter = true;
          isolation = true;
          file_format = "sqlite";
        };
        rm.always_trash = true;
        cursor_shape = {
          vi_insert = "blink_line";
          vi_normal = "blink_underscore";
        };
      };

      extraConfig = ''
        ${import-aliases {
          bat = "bat-aliases";
          git = "git-aliases";
        }}
        ${import-completions {
          gh = "gh-completions";
          tealdeer = "tldr-completions";
          git = "git-completions";
        }}
        let carapace_completer = {|spans: list<string>|
          carapace $spans.0 nushell ...$spans
          | from json
          | if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) { $in } else { null }
        }

        $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'

        let fish_completer = {|spans|
          ${lib.getExe pkgs.fish} --command $'complete "--do-complete=($spans | str join " ")"'
          | from tsv --flexible --noheaders --no-infer
          | rename value description
        }

        let zoxide_completer = {|spans|
            $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
        }

        let multiple_completers = {|spans|
          let expanded_alias = scope aliases
          | where name == $spans.0
          | get -i 0.expansion

          let spans = if $expanded_alias != null {
            $spans
            | skip 1
            | prepend ($expanded_alias | split row ' ' | take 1)
          } else {
            $spans
          }

          match $spans.0 {
            __zoxide_z | __zoxide_zi => $zoxide_completer
            zig => $fish_completer
            rimi => $fish_completer
            berg => $fish_completer
            xmake => $fish_completer
            crimson => $fish_completer
            _ => $carapace_completer
          } | do $in $spans
        }

        $env.config = {
          completions: {
            external: {
              completer: $multiple_completers
            }
          }
          hooks: {
            command_not_found: {
              |command_name|
              print (${command-not-found} $command_name | str trim)
            }
          }
        }

        $env.PATH = ($env.PATH |
          split row (char esep) |
          prepend ${config.home.homeDirectory}/.apps |
          append /usr/bin/env
        )

        if ("${config.xdg.configHome}/nushell/extra.nu" | path exists) {
          source ${config.xdg.configHome}/nushell/extra.nu
        }

        source ${atuin-completions}/atuin.nu
        source ${crimson-completions}/crimson.nu
      '';

      shellAliases = {
        zc = "clear ; cd";
        zngrt = "cd (git rev-parse --show-toplevel)";
      } // config.home.shellAliases;
    };
  };
}
