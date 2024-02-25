{...}:{
  programs.yazi = {
    enable = true;
    settings = {
      ratio = [1 4 3];
      sort_by = "natural";
      sort_dir_first = true;
      show_hidden = false;
      show_symlink = true;

      opener = {
        archive = [{exec = ''extract "$1"''; desc = "Extract here";} ];
        text = [{exec = ''vi "$@"''; block = true;}];
        document = [{exec = ''${pkgs.zathura}/bin/zathura "$@"'';}];
        image = [{exec = ''pqiv "@"''}];
      };
      open = {
        rules = [
          	{ name = "*.pdf"; use = "document"; }
        ];
      };
    };
    keymaps = {
      input.keymap = [
        {on = ["<C-h>"]; exec = "hidden toggle";}
        {on = ["<C-n"]; exec = "cd --interactive";}
        {on = ["<C-o>"]; exec = "open --interactive";}
        {on = ["<C-c>"]; exec = "yank";}
        {on = ["<C-x>"]; exec = "yank --cut";}
        {on = ["<C-v>"]; exec = "paste";}
        {on = ["<C-b>"]; exec = "unyank";}
        {on = ["<C-l>"]; exec = "link";}
        {on = ["<n>"]; exec = "create";}
        {on = ["<F12>"]; exec = "tab_create";}
        {on = ["<F11>"]; exec = "tab_close";}
        {on = ["<F10>"]; exec = "tab_switch";}
      ];
    }
  }
}
