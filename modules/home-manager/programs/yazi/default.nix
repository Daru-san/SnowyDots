{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  theme = with pkgs;
    fetchFromGitHub {
      owner = "catppuccin";
      repo = "yazi";
      rev = "0846aed69b2a62d29c98e100af0cf55ca729723d";
      hash = "sha256-2T41qWMe++3Qxl9veRNHMeRI3eU4+LAueKTss02gYNk=";
    }
    + "/themes/mocha.toml";
in {
  imports = [./lua.nix];
  xdg.configFile = {
    "yazi/theme.toml".source = theme;
    "yazi/plugins/exifaudio.yazi".source = with pkgs;
      fetchFromGitHub {
        owner = "Sonico98";
        repo = "exifaudio.yazi";
        rev = "94329ead8b3a6d3faa2d4975930a3d0378980c7a";
        hash = "sha256-jz6fVtcLHw9lsxFWECbuxE7tEBttE08Fl4oJSTifaEc=";
      };
    "yazi/plugins/glow.yazi".source = with pkgs;
      fetchFromGitHub {
        owner = "Reledia";
        repo = "glow.yazi";
        rev = "54b34c2b337ab0933130a06f61038398efa9ce65";
        hash = "sha256-YTe76i5pdw0GhzWGBU41FDAKy3PJR7aPQgn+dbXHPNg=";
      };
    "yazi/plugins/mime.yazi".source = with pkgs;
      fetchFromGitHub {
        owner = "DreamMaoMao";
        repo = "mime.yazi";
        rev = "0ba4bb22e452c287daaf67fe87e218dc12205dba";
        hash = "sha256-K+JXBfJPPl/scLeMCq4+OiyGjYKM7bJgdZf8q8O+2zk=";
      };
  };
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableZshIntegration = true;
    settings = {
      manager = {
        ratio = [1 3 4];
        sort_by = "natural";
        sort_dir_first = true;
        show_hidden = false;
        show_symlink = false;
        linemode = "size";
      };
      log = {enabled = false;};
      plugin = with lib; {
        prepend_previewers = [
          {
            mime = "audio/*";
            exec = "exifaudio";
          }
          {
            mime = "*.md";
            exec = "glow";
          }
        ];
      };
      opener = {
        archive = [
          {
            exec = ''extract "$1"'';
            desc = "Extract here";
          }
        ];
        text = [
          {
            exec = ''${with lib; getExe config.programs.neovim.package} "$@"'';
            block = true;
          }
        ];
        document = [{exec = ''${with lib; getExe config.programs.zathura.package}"$@"'';}];
        image = [{exec = ''${with lib; getExe config.programs.pqiv.package} "@"'';}];
      };
      open = {
        rules = [
          {
            mime = "*.pdf";
            use = "document";
          }
        ];
      };
    };
    keymap = {
      input.keymap = [
        {
          exec = "close";
          on = ["<c-q>"];
        }
        {
          exec = "close --submit";
          on = ["<enter>"];
        }
        {
          exec = "escape";
          on = ["<esc>"];
        }
        {
          exec = "backspace";
          on = ["<backspace>"];
        }
      ];
      manager.keymap = [
        {
          exec = "escape";
          on = ["<esc>"];
        }
        {
          exec = "quit";
          on = ["q"];
        }
        {
          exec = "close";
          on = ["<c-q>"];
        }
        {
          on = ["o"];
          run = "open";
          desc = "Open the selected files";
        }
        {
          on = ["O"];
          run = "open --interactive";
          desc = "Open the selected files interactively";
        }
        {
          on = ["<Enter>"];
          run = "open";
          desc = "Open the selected files";
        }
        {
          on = ["<C-Enter>"];
          run = "open --interactive";
          desc = "Open the selected files interactively";
        }
        {
          on = ["l"];
          run = "plugin --sync smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        {
          on = ["<C-s>"];
          run = ''shell "$SHELL" --block --confirm'';
          desc = "Open shell here";
        }
        {
          on = ["<Esc>"];
          run = "close";
          desc = "Cancel input";
        }
      ];
    };
  };
}
