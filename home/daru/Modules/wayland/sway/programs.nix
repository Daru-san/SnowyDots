{pkgs, ...}:{
  home.packages = with pkgs; [
    swayws
    swaysome
    swaysettings
  ];
}
