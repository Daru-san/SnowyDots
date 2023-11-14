{config, pkgs, ...}:{
  home.packages = with pkgs.unstable; [
    cmus
  ];
}
