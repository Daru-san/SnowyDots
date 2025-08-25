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
    };
  };
}
