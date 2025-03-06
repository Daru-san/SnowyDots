{ pkgs, lib, ... }:
let
  lldb-dap = {
    command = lib.getExe' pkgs.lldb "lldb-dap";
    name = "dap-lldb";
    port-arg = "--port {}";
    transport = "tcp";
    templates = [
      {
        name = "binary";
        request = "launch";
        completion = [
          {
            completion = "filename";
            name = "binary";
          }
        ];
        args = {
          program = "{0}";
          runInTerminal = true;
        };
      }
    ];
  };

  lldb-rust-primer = pkgs.writers.writePython3 "rust-primer.py" { doCheck = false; } ''
    import subprocess
    import pathlib
    import lldb

    # Determine the sysroot for the active Rust interpreter
    rustlib_etc = pathlib.Path(subprocess.getoutput('rustc --print sysroot')) / 'lib' / 'rustlib' / 'etc'
    if not rustlib_etc.exists():
        raise RuntimeError('Unable to determine rustc sysroot')

        # Load lldb_lookup.py and execute lldb_commands with the correct path
        lldb.debugger.HandleCommand(f"""command script import "{rustlib_etc / 'lldb_lookup.py'}" """)
        lldb.debugger.HandleCommand(f"""command source -s 0 "{rustlib_etc / 'lldb_commands'}" """)
  '';

  lldb-rust = {
    inherit (lldb-dap) command port-arg transport;
    name = "dap-lldb-rust";
    templates = [
      {
        name = "binary";
        request = "launch";
        completion = [
          {
            completion = "filename";
            name = "binary";
          }
        ];
        args = {
          program = "{0}";
          initCommands = [
            "command script import ${lib.getExe lldb-rust-primer}"
          ];
        };
      }
    ];
  };

  efm-config = lib.generators.toYAML {
    version = 2;
    languages = {
      markdown = {
        lint-command = "markdownlint -s";
        lint-stdin = true;
        lint-after-open = true;
        lint-on-save = true;
        lint-formats = [
          "%f:%l %m"
          "%f:%l:%c %m"
          "%f: %l: %m"
        ];
      };
    };
  };

in
{
  language-server = {
    rust-analyzer = {
      config.check = "clippy";
    };
    sqls = {
      command = "sqls";
    };
    efm = {
      command = [
        "efm-langserver"
        "-c"
        efm-config
      ];
    };
  };
  language = [
    {
      name = "nix";
      auto-format = true;
      formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      language-servers = [
        "nil"
        "nixd"
      ];
    }
    {
      name = "c";
      language-servers = [ "clangd" ];
      debugger = lldb-dap;
    }
    {
      name = "cpp";
      language-servers = [ "clangd" ];
      debugger = lldb-dap;
    }
    {
      name = "rust";
      language-servers = [ "rust-analyzer" ];
      debugger = lldb-rust;
    }
    {
      name = "markdown";
      language-servers = [
        "marksman"
        "vale"
        "ltex-ls-plus"
        {
          name = "efm";
          only-features = [ "diagnostics" ];
        }
      ];
    }
    {
      name = "zig";
      debugger = lldb-dap;
    }
    {
      name = "python";
      language-servers = [ "pylsp" ];
    }
    {
      name = "sql";
      language-servers = [ "sqls" ];
      auto-format = false;
    }
    {
      name = "toml";
      formatter = {
        command = "taplo";
        args = [
          "fmt"
          "-"
        ];
      };
    }
  ];
}
