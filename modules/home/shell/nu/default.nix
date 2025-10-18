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

  import-scripts =
    initial_paths:
    let
      paths = builtins.map (path: {
        inherit path;
        exists = builtins.pathExists path;
      }) (builtins.map (path: "${pkgs.nu_scripts}/share/nu_scripts/${path}") initial_paths);
    in
    if (builtins.any (v: !v.exists) paths) then
      throw (
        "The following nushell script paths do not exist:\n"
        + (builtins.concatStringsSep "\n" (builtins.map (v: v.path) (builtins.filter (v: !v.exists) paths)))
      )
    else
      builtins.map (value: "use ${value.path} *") paths;

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

  import-modules =
    set:
    builtins.concatStringsSep "\n" (
      import-scripts (lib.mapAttrsToList (name: value: "modules/${name}/${value}.nu") set)
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

      extraConfig = # nu
        ''
          ${import-aliases {
            bat = "bat-aliases";
            git = "git-aliases";
          }}

          ${import-completions {
            gh = "gh-completions";
            tealdeer = "tldr-completions";
            git = "git-completions";
            cargo = "cargo-completions";
            curl = "curl-completions";
          }}

          ${import-modules {
            background_task = "task";
            nix = "nix";
            network = "sockets/sockets";
            formats = "from-cpuinfo";
          }}

          ${import-modules {
            formats = "from-dmidecode";
            nix = "nufetch";
          }}

          ${import-modules {
            formats = "to-ini";
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
            | get -o 0.expansion

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
              command_not_found: (source ${./command-not-found.nu})
            }
          }

          $env.PATH = ($env.PATH |
            split row (char esep) |
            prepend ${config.home.homeDirectory}/.apps |
            prepend ${./scripts} |
            append /usr/bin/env
          )

          if ("${config.xdg.configHome}/nushell/extra.nu" | path exists) {
            source ${config.xdg.configHome}/nushell/extra.nu
          }

          source ${atuin-completions}/atuin.nu
          source ${crimson-completions}/crimson.nu
        '';

      shellAliases = lib.mkMerge [
        {
          zc = "clear ; cd";
          zngrt = "cd (git rev-parse --show-toplevel)";
          logout = lib.mkForce "loginctl terminate-user $env.User";
        }
        config.home.shellAliases
      ];
    };
  };
}
