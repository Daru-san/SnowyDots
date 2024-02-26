{pkgs, ...}: let
  theme = pkgs.fetchFromGitHub {
    owner = "Msouza91";
    repo = "rose-pine.yazi";
    rev = "4101d0d9c475f23d94b7262e7fd945930378807e";
    hash = "sha256-Ygx3tyefGcq3Qqk/72RSJbT5K8G7wVqIk2rCI0vKkNQ=";
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
