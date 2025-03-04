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
      debugger = codelldb-debuger;
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
