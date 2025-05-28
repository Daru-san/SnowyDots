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
  ];
}
