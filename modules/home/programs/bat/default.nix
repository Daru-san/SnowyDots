{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
      pager = "less -FR";
      paging = "always";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batdiff
      batgrep
    ];
  };
}
