{...}:{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.batExtras; [batman batdiff batgrep batwatch prettybat batpipe];
  };
}
