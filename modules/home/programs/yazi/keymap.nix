{
  manager.prepend_keymap = [
    {
      on = [
        "f"
        "g"
      ];
      run = "plugin fg";
      desc = "find file by content";
    }
    {
      on = [
        "f"
        "f"
      ];
      run = "plugin fg --args='fzf'";
      desc = "find file by file name";
    }
    {
      on = [ "l" ];
      run = "plugin --sync smart-enter";
      desc = "Enter the child directory, or open the file";
    }
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
      on = [ "t" ];
      run = "plugin --sync hide-preview";
      desc = "Hide or show preview";
    }
    {
      on = [ "T" ];
      run = "plugin --sync max-preview";
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
        "c"
        "s"
      ];
      run = "plugin what-size";
      desc = "Calculate size of hovered file/folder";
    }
    {
      on = [ "<C-y>" ];
      run = [ "plugin clipboard" ];
      desc = "Copy current item(s) to system clipboard";
    }

  ];
}
