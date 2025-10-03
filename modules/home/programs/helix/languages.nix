{
  pkgs,
  lib,
  vale,
  ...
}:
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
            "command script import ${lldb-rust-primer}/bin/rust-primer.py"
          ];
        };
      }
    ];
  };

  dprint-config = pkgs.writers.writeJSON "config.json" {
    markdown = {
      lineWidth = 80;
    };
    excludes = [ ];
    plugins = with pkgs.dprint-plugins; [
      g-plane-pretty_yaml
      g-plane-malva
      dprint-plugin-markdown
      dprint-plugin-toml
    ];
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
    ruff = {
      command = "ruff";
      args = [ "server" ];
    };
    basedpyright = {
      config = {
        basedpyright.analysis.diagnosticSeverityOverrides = {
          reportUnknownVariableType = "none";
        };
      };
    };
    efm = {
      command = lib.getExe pkgs.efm-langserver;
    };
    typos = {
      command = lib.getExe pkgs.typos-lsp;
    };
    vale = {
      command = lib.getExe (
        pkgs.vale-ls.override {
          inherit vale;
        }
      );
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
      language-servers = [
        "rust-analyzer"
        "typos"
      ];
      debugger = lldb-rust;
    }
    {
      name = "markdown";
      language-servers = [
        "marksman"
        "vale-ls"
        "typos"
        {
          name = "efm";
          only-features = [ "diagnostics" ];
        }
      ];
      filetypes = [
        "md"
        "mdx"
      ];
      formatter = {
        command = lib.getExe pkgs.dprint;
        args = [
          "fmt"
          "--stdin"
          "md"
          "-c"
          "${dprint-config}/config.json"
        ];
      };
    }
    {
      name = "zig";
      debugger = lldb-dap;
      language-servers = [
        "zls"
        "typos"
      ];
    }
    {
      name = "python";
      language-servers = [
        "basedpyright"
        "ruff"
      ];
      formatter = {
        command = "ruff";
        args = [
          "format"
          "--quiet"
          "-"
        ];
      };
      auto-format = true;
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
    {
      name = "lua";
      auto-format = true;
      formatter = {
        command = "stylua";
        args = [ "-" ];
      };
    }
  ];
}
