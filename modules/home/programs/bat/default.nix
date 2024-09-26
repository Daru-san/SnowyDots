{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
      pager = "less -FR";
      paging = "always";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      pkgs.stable.bat-extras.batdiff
      batgrep
    ];
  };
}
