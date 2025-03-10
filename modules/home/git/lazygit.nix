{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        screenMode = "half";
        border = "hidden";
        mainPanelSplitMode = "horizontal";
        expandFocusedSidePanel = true;
        mouseEvents = true;
        commitLength.show = true;
        showFileTree = true;
        showBottomLine = false;
        nerdFontsVersion = 3;
        portaitMode = "always";
        showFileIcons = true;
        showRandomTip = true;
      };
      git = {
        autoFetch = true;
        autoRefresh = true;
        fetchAll = false;
        mainBranches = [
          "master"
          "main"
        ];
        paging = {
          colorArg = "always";
          pager = "diff-so-fancy";
        };
      };
      os = {
        editPreset = "hx";
      };
      refresher = {
        refreshInterval = 7;
        fetchInterval = 60;
      };
      keybinding = {
        status = {
          checkForUpdate = "u";
          recentRepos = "<enter>";
        };
      };
      update.method = "never";
      notARepository = "prompt";
      disableStartupPopups = true;
      confirmOnQuit = true;
    };
  };
}
