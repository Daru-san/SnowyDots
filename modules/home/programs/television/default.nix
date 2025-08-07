{
  programs.television = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    channels = {
      git-log = {
        metadata = {
          description = "Git log entries";
          name = "git-log";
          requirements = [ "git" ];
        };
        preview = {
          command = "git show -p --stat --pretty=fuller --color=always '{0}";
        };
        source = {
          command = "git log --oneline --date=short --pretty=\"format:%h %s %an %cd\" \"$@\"";
          output = "{split: :0}";
        };
      };
      files = {
        metadata = {
          description = "Files";
          name = "files";
          requirements = [
            "fd"
            "bat"
          ];
          source = {
            command = "fd -t f";
          };
          preview = {
            command = "bat -n --color=always {}";
          };
          ui = {
            preview_panel = {
              size = 70;
              scrollbar = true;
            };
          };
          keybindings = {
            shortcut = "f1";
          };
        };
      };
    };
  };
}
