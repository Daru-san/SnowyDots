[
  {
    label = "Yazi";
    command = "yazi $ZED_DIRNAME --chooser-file /tmp/yazi-path-zed && zeditor -a $(cat /tmp/yazi-path-zed)";
    shell = {
      program = "sh";
    };
    hide = "always";
    use_new_terminal = true;
    allow_concurrent_runs = false;
  }
  {
    label = "Yazi(Root)";
    command = "yazi $ZED_WORKSPACE_ROOT --chooser-file /tmp/yazi-path-zed && zeditor -a $(cat /tmp/yazi-path-zed)";
    shell = {
      program = "sh";
    };
    hide = "always";
    use_new_terminal = true;
    allow_concurrent_runs = false;
  }
  {
    label = "Lazygit";
    command = "lazygit";
    shell = {
      program = "sh";
    };
    hide = "always";
    use_new_terminal = true;
    allow_concurrent_runs = false;
  }
]
