{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin";
      pager = "less -FR";
      paging = "always";
    };
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "a875b71dc5514b2eae9174b0591ef421887aa99f";
          hash = "sha256-PWX8LR3xTgNBUpk+xBIGpEBQCNJHre8cRX4OTSWkZvs=";
        };
        file = "themes/Catppuccin\ Mocha.tmTheme";
      };
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batdiff
      batgrep
      batwatch
      prettybat
      batpipe
    ];
  };
}
