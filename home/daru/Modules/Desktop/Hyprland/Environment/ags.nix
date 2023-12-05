{pkgs, ...}:{
  programs.ags = {
    enable = true;
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
