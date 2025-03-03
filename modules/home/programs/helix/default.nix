{ pkgs, lib, ... }:
{
  stylix.targets.helix.enable = false;
  programs.helix = {
    enable = true;
    languages = import ./languages.nix { inherit pkgs lib; };
    defaultEditor = true;
    extraPackages = import ./packages.nix { inherit pkgs; };
    settings = {
      theme = "kaolin-dark";
      keys = import ./keys.nix;
      editor = {
        auto-save = {
          after-delay.enable = true;
        };
        mouse = true;
        line-number = "absolute";
        cursorline = true;
        cursorcolumn = false;
        continue-comments = false;
        auto-completion = true;
        path-completion = true;
        auto-format = true;
        preview-completion-insert = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        bufferline = "multiple";
        statusline = {
          left = [
            "mode"
            "spinner"
            "version-control"
          ];
          center = [
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "position-percentage"
            "file-encoding"
          ];
        };
        lsp = {
          enable = true;
          display-messages = true;
          display-progress-messages = true;
          auto-signature-help = true;
          display-inlay-hints = false;
          snippets = true;
        };
        indent-guides = {
          render = true;
        };
      };
    };
  };
}
