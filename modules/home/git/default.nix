{
  imports = [
    ./lazygit.nix
    ./gh.nix
  ];
  programs = {
    git-cliff = {
      enable = true;
    };
    diff-so-fancy = {
      enable = true;
      enableGitIntegration = true;
    };
    git = {
      enable = true;
      signing.format = "ssh";
      settings = {
        user = {
          name = "Daru";
          email = "mica.tui@proton.me";
        };

        core = {
          editor = "vi";
          fileMode = false;
          autocrlf = false;
        };

        # Git aliases
        aliases = {
          ci = "commit";
          co = "checkout";
          cl = "clone";
          st = "status";
          ad = "add";
          ps = "push";
          pl = "pull";
          re = "remote";
          br = "branch";
          fe = "fetch";
          cp = "cherry-pick";
          rs = "reset";
          df = "diff";
          "in" = "init";
          sw = "switch";
        };
      };
    };
  };
}
