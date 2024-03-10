{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  tomlFormat = pkgs.formats.toml {};
  cfg = config.programs.yazi;

  theme = with pkgs;
    fetchFromGitHub {
      owner = "catppuccin";
      repo = "yazi";
      rev = "0846aed69b2a62d29c98e100af0cf55ca729723d";
      hash = "sha256-2T41qWMe++3Qxl9veRNHMeRI3eU4+LAueKTss02gYNk=";
    }
    + "/themes/mocha.toml";
  keymap = with pkgs;
    fetchFromGitHub {
      owner = "sxyazi";
      repo = "yazi";
      rev = "78b98a98c356b2846d902aa349b8474d8fa60cd6";
      hash = "sha256-LhGaQi2VbH6yZ2ujLeD66BeB2E7oO1/KnLnkZ9YKKKc=";
    }
    + "/yazi-config/preset/keymap.toml";
in {
  imports = [./lua.nix];
  xdg.configFile = {
    "yazi/theme.toml".source = theme;
    "yazi/keymap.toml".source = keymap;
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
            run = "exifaudio";
          }
          {
            mime = "*.md";
            run = "glow";
          }
        ];
      };
      opener = {
        archive = [
          {
            run = ''extract "$1"'';
            desc = "Extract here";
          }
        ];
        document = [{run = ''${with lib; getExe config.programs.zathura.package}"$@"'';}];
        image = [{run = ''${with lib; getExe config.programs.pqiv.package} "@"'';}];
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
  };
}
