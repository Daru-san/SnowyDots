{
  lib,
  pkgs,
  config,
  ...
}:
{
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
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
            _ => $carapace_completer
            git => $fish_completer
            adb => $fish_completer
            zig => $fish_completer
            rimi => $fish_completer
            nix => $fish_completer
          } | do $in $spans
        }

        $env.config = {
          edit_mode: vi,
          show_banner: false,
          completions: {
            case_sensitive: false
            quick: true
            partial: true
            algorithm: "fuzzy"
            external: {
              enable: true
              max_results: 100
              completer: $multiple_completers
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
      '';

      shellAliases = {
        zc = "clear ; z";
        zngrt = "cd (git rev-parse --show-toplevel)";
      } // config.home.shellAliases;
    };
  };
}
