{ pkgs, lib, ... }:
let
  codelldb-debuger = {
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

in
{
  language-server = {
    rust-analyzer = {
      config.check = "clippy";
    };
    sqls = {
      command = "sqls";
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
      debugger = codelldb-debuger;
    }
    {
      name = "cpp";
      language-servers = [ "clangd" ];
      debugger = codelldb-debuger;
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
        "ltex-ls"
      ];
    }
    {
      name = "zig";
      debugger = codelldb-debuger;
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
