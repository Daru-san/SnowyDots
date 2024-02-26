{pkgs, ...}: let
  theme = pkgs.fetchFromGitHub {
    owner = "Reledia";
    repo = "flexoki.yazi";
    rev = "2987ef67b15683d041d708275ff4625a478ff18d";
    hash = "sha256-qAg0BUO8jh0R1LIg4UwFLKFr247ZLi5mmwrSzEQDf1Q=";
  };
in {
  xdg.configFile."yazi/theme.toml".source = "${theme}/theme.toml";
  programs.yazi = {
    enable = true;
    settings = {
      ratio = [1 4 3];
      sort_by = "natural";
      sort_dir_first = true;
      show_hidden = false;
      show_symlink = true;

      opener = {
        archive = [
          {
            exec = ''extract "$1"'';
            desc = "Extract here";
          }
        ];
        text = [
          {
            exec = ''vi "$@"'';
            block = true;
          }
        ];
        document = [{exec = ''${pkgs.zathura}/bin/zathura "$@"'';}];
        image = [{exec = ''pqiv "@"'';}];
      };
      open = {
        rules = [
          {
            name = "*.pdf";
            use = "document";
          }
        ];
      };
    };
  };
}
