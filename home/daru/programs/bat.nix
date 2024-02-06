{pkgs,...}:{
  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
      pager = "less -FR";
    };
    extraPackages = with pkgs.bat-extras; [batman batdiff batgrep batwatch prettybat batpipe];
  };
}
