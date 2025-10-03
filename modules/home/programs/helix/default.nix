{ pkgs, lib, ... }:
let
  vale = pkgs.vale.withStyles (s: [
    s.proselint
    s.google
    s.write-good
  ]);
in
{
  stylix.targets.helix.enable = true;
  xdg.configFile."vale/.vale.ini".text = lib.generators.toINIWithGlobalSection { } {
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
  programs.helix = {
    enable = true;
    languages = import ./languages.nix { inherit pkgs lib vale; };
    # defaultEditor = true;
    extraPackages = import ./packages.nix { inherit pkgs; };
    themes = import ./themes { inherit lib; };
    settings = {
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
