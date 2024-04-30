{
  manager.prepend_keymap = [
    {
      on = ["f" "g"];
      run = "plugin fg";
      desc = "find file by content";
    }
    {
      on = ["f" "f"];
      run = "plugin fg --args='fzf'";
      desc = "find file by file name";
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
  ];
}
