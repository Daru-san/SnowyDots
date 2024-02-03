{pkgs,...}:{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [batman batdiff batgrep batwatch prettybat batpipe];
  };
}
