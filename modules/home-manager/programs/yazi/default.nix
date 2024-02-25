{pkgs, ...}: {
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
