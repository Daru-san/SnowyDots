{pkgs, lib, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = false;
    

    settings = {
      theme = "catppuccin_macchiato_transparent";
      editor = {
        line-number = "relative";
        lsp = {
          # TODO: enable https://github.com/helix-editor/helix/pull/6417 once it's merged
          display-messages = true;
          display-inlay-hints = true;
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          language-server = {
            command = with lib; "$getExe pkgs.rnix-lsp}";
          };
        }
      ];
    };

    themes.catppuccin_macchiato_transparent = {
      inherits = "catppuccin_macchiato";
      "ui.background" = {};
    };
  };
}
