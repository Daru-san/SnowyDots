{pkgs,...}:{
  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
      pager = "${pkgs.page}/bin/page";
    };
    extraPackages = with pkgs.bat-extras; [batman batdiff batgrep batwatch prettybat batpipe];
  };
}
