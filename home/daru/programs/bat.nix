{pkgs,...}:{
  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
      pager = "nvim -R";
    };
    extraPackages = with pkgs.bat-extras; [batman batdiff batgrep batwatch prettybat batpipe];
  };
}
