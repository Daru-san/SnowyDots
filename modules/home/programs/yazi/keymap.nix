{
  mgr.prepend_keymap = [
    {
      on = [ "<C-s>" ];
      run = ''shell "$SHELL" --block --confirm'';
      desc = "Open shell here";
    }
    {
      on = [ "<C-g>" ];
      run = ''shell "lazygit" --block --confirm'';
      desc = "Open lazygit";
    }
    {
      on = [ "R" ];
      run = "plugin rsync";
      desc = "Copy files with rsync";
    }
    {
      on = [ "b" ];
      run = "plugin hide-preview";
      desc = "Hide or show preview";
    }
    {
      on = [ "B" ];
      run = "plugin max-preview";
      desc = "Maximize or restore preview";
    }
    {
      on = [
        "c"
        "m"
      ];
      run = "plugin chmod";
      desc = "Chmod on selected files";
    }
    {
      on = [ "u" ];
      run = "plugin restore";
      desc = "Restore deleted files";
    }
    {
      on = [ "o" ];
      run = "plugin open-with-cmd --args=block";
      desc = "Open with command in the terminal";
    }
    {
      on = [ "O" ];
      run = "plugin open-with-cmd";
      desc = "Open with command";
    }
    {
      on = [
        "f"
        "r"
      ];
      run = "plugin fr rg";
      desc = "Search file using rg";
    }
    {
      on = [
        "f"
        "a"
      ];
      run = "plugin fr rga";
      desc = "Search file using rga";
    }
    {
      on = [
        "c"
        "s"
      ];
      run = "plugin what-size";
      desc = "Calculate size of hovered file/folder";
    }
  ];
}
