{
  pkgs,
  lib,
  config,
  ...
}:
let
  vale = pkgs.vale.withStyles (s: [
    s.proselint
    s.google
    s.write-good
  ]);
in
{
  stylix.targets.helix.enable = true;
  xdg.configFile."vale/.vale.ini" = {
    enable = config.programs.helix.enable;
    text = lib.generators.toINIWithGlobalSection { } {
      globalSection = {
        StylesPath = "${vale}/share/vale/styles";
      };
      sections = {
        formats = {
          mdx = "md";
        };
        "*.{md,rst}" = {
          BasedOnStyles = lib.concatStringsSep ", " [
            "proselint"
            "Google"
            "write-good"
            "Vale"
          ];
        };
      };
    };
  };
  programs.helix = {
    enable = false;
    languages = import ./languages.nix { inherit pkgs lib vale; };
    defaultEditor = false;
    extraPackages = import ./packages.nix { inherit pkgs; };
    # themes = import ./themes { inherit lib; };
    settings = {
      keys = import ./keys.nix;
      editor = {
        auto-save = {
          after-delay.enable = true;
        };
        end-of-line-diagnostics = "hint";
        mouse = true;
        line-number = "absolute";
        cursorline = false;
        cursorcolumn = false;
        continue-comments = true;
        auto-completion = true;
        path-completion = true;
        completion-replace = true;
        trim-trailing-whitespace = true;
        trim-final-newlines = true;
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
            "version-control"
            "spinner"
            "separator"
            "diagnostics"
            "separator"
            "workspace-diagnostics"
          ];
          center = [
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          right = [
            "file-type"
            "separator"
            "selections"
            "register"
            "position"
            "position-percentage"
            "file-encoding"
          ];
          separator = "|";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
          diagnostics = [
            "hint"
            "warning"
            "error"
          ];
        };
        lsp = {
          enable = true;
          display-messages = true;
          display-progress-messages = true;
          auto-signature-help = true;
          display-inlay-hints = false;
          snippets = true;
          display-color-swatches = true;
        };
        indent-guides = {
          render = true;
        };
        inline-diagnostics = {
          cursor-line = "warning";
        };
      };
    };
  };
}
