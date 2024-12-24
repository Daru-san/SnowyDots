{
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "dart"
      "toml"
      "lua"
      "zig"
      "marksman"
      "nu"
      "meson"
      "nightfox"
    ];
    extraPackages = with pkgs; [
      lua
      nixd
      dart
      zls
      zig
      nushell
      meson
      mesonlsp
      clang-tools
      cargo
      rust-analyzer
      rustc
      rustfmt
      clippy
      nil
      nixfmt-rfc-style
    ];
    userSettings = {
      features = {
        copilot = false;
      };
      language_models = {
        copilot_chat = null;
      };
      assistant = {
        default_model = {
          provider = "google";
          model = "gemini-1.5-flash";
        };
        version = "2";
      };
      base_keymap = "Atom";
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "system";
        light = "One Light";
        dark = "Carbonfox";
      };
      project_panel = {
        button = false;
        indent_size = 24;
      };
      vim = {
        toggle_relative_line_numbers = true;
      };
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "nixd"
          ];
          formatter.external = {
            command = "nixfmt";
          };
        };
      };
      load_direnv = "shell_hook";
      toolbar.quick_actions = false;
      outline_panel.button = false;
      collaboration_panel.button = false;
      chat_panel.button = false;
      notification_panel.button = false;
    };
  };
}
